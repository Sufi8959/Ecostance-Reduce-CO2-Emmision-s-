import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/cart/apply_coupon_regular_response/apply_coupon_regular_response.dart';
import 'package:net_carbons/data/cart/hiveModal/cart_hive_modal.dart';
import 'package:net_carbons/data/cart/server_response/response.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/app_api.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/domain/cart/i_repository.dart';
import 'package:net_carbons/domain/cart/models/apply_coupon.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/domain/cart/models/coupon_modal.dart';
import 'package:net_carbons/domain/cart/models/server_resp_modals.dart';

import '../../../app/constants/string_constants.dart';
import '../calculate_express_checkout_with_coupon_response/data.dart';

class CartRepository implements ICartRepository {
  final dio = getIt<DioManager>();
  final appApi = getIt<AppApi>();

  @override
  Future<Either<Failure, List<HiveCartModal>>> getCart() async {
    final cart = await getData();
    if (cart.isNotEmpty) {
      return Right(cart);
    } else {
      return Left(Failure('cartIsEmpty'));
    }
  }

  @override
  Future<void> saveCartToLocal(Map<String, ProductCartModal> products) async {
    await clearCartDb();

    for (var product in products.values) {
      await addToCart(HiveCartModal(product.id, product.quantity));
    }

    getData();
  }

  @override
  Future<Either<Failure, CartServerModal>> getCartFromServer({required String currency,
      required bool considerChangedCurrency,
      required bool getStripeCoupon}) async {
    try {
      final resp = await dio.get('/v1/carts',
          queryParameters: {'getStripeCoupon': getStripeCoupon});

      if (resp.statusCode == 200) {
        final response = CartServerResponseMain.fromJson(resp.data);
        final data = response.data;

        return Right(data.toDomain(currency,considerChangedCurrency));
      } else if (resp.statusCode == 401) {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Wrong username or password"));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      return Left(ClientFailure(message: 'Unknown error in cart')
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ClientFailure(message: 'Unknown error in cart')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, CartServerModal>> saveCartToServer(
      {required Map<String, ProductCartModal> products,
      required String currency,
      required bool itemsPreLogin,
      required bool considerChangedCurrency,
      required bool getStripeCoupon}) async {
    final data = products.entries
        .map((e) => {
              'product': e.value.id,
              "cartItemId": e.value.id,
              'quantity': e.value.quantity
            })
        .toList();

    try {
      log("saveCartToServer ---> ${jsonEncode(data)}");
      log("saveCartToServer currency ---> $currency");
      final resp = await dio.patch('/v1/carts', data: {
        'products': data,
        "updateCurrency": currency,
        'itemsPreLogin': itemsPreLogin,
        "getStripeCoupon": getStripeCoupon
      });

      if (resp.statusCode == 200) {
        final response = CartServerResponseMain.fromJson(resp.data);
        final data = response.data;
        return Right(data.toDomain(currency,considerChangedCurrency));
      } else if (resp.statusCode == 401) {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Wrong username or password"));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
  
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, ApplyCouponResponseModal>> applyCoupon({
    required String type,
    required String code,
    required bool getStripeCoupon,
    String? productId,
    int? quantity,
  }) async {
    try {
      final resp = await dio.post('/v1/coupons/$code/apply', data: {
        "type": type,
        "productId": productId,
        "productQuantity": quantity,
        "getStripeCoupon": getStripeCoupon
      });

      if (resp.statusCode == 200) {
        final response = ApplyCouponRegularResponse.fromJson(resp.data);
        final domainData = response.toDomain();
        // saveCouponData(domainData.toHiveModal());
        return Right(domainData);
      } else if (resp.statusCode == 401) {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Generic Error"));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.response?.data['message'])
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ClientFailure(message: "Unable to apply coupon")
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  // @override
  // Future<Either<Failure, ApplyCouponResponseModal?>>
  //     getCouponFromLocal() async {
  //   try {
  //   //  final res = await getCoupon();
  //     return Right(res.fromHiveModal());
  //   } catch (e) {
  //     return Left(Failure('No coupon found'));
  //   }
  // }

  @override
  Future<void> clearCouponFromLocal() async {
    //  await clearCoupon();
  }

  @override
  Future<Either<Failure, CartServerModal>> couponUnApply(
      {required String currency, required bool considerChangedCurrency}) async {
    final res = await appApi.apiPatch(endpoint: '/v1/coupons/unapply');
    return res.fold((l) => Left(l), (r) {
      final response = CartServerResponseMain.fromJson(r.data);
      final domainData = response.data.toDomain(currency,considerChangedCurrency);
      return Right(domainData);
    });
  }

  @override
  Future<void> clearLocalCart() async {
    await clearCartDb();
  }

  @override
  Future<Either<Failure, CartServerModal>> removeItem(
      {
    required String itemId,
    required String currency,
    getStripeCoupon,
    required bool considerChangedCurrency,
  }) async {
    final res = await appApi.apiPatch(
        endpoint: '/v1/carts/$itemId/remove',
        data: {"getStripeCoupon": getStripeCoupon});
    return res.fold((l) => Left(l), (r) {
      final response = CartServerResponseMain.fromJson(r.data);
      return Right(response.data.toDomain(currency,considerChangedCurrency));
    });
  }

  @override
  Future<Either<Failure, CalculateExpressCheckoutWithCouponResponse>>
      calculateExpressCheckout(
          {required bool getStripeCoupon,
          required String productId,
          required int quantity,
          CouponStateModal? couponStateModal}) async {
    try {
      final resp = await dio.patch('/v1/calculate-express-checkout', data: {
        "getStripeCoupon": getStripeCoupon,
        "products": [
          {"product": productId, "quantity": quantity}
        ],
        "coupon": couponStateModal?.name
      });

      if (resp.statusCode == 200) {
        return Right(CalculateExpressCheckoutWithCouponResponse.fromJson(
            resp.data['data']));
      } else if (resp.statusCode == 401) {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Generic Error"));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.response?.data['message'])
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ClientFailure(message: "Unable to apply coupon")
          .orGeneric("Something went wrong. Please try again later."));
    }
  }
}

// Future<void> saveCouponData(ApplyCouponHiveModal applyCouponHiveModal) async {
//   final db = await Hive.openBox<ApplyCouponHiveModal>(AppStrings.couponDb);
//   db.clear();
//   db.add(applyCouponHiveModal);
// }
//
// Future<ApplyCouponHiveModal> getCoupon() async {
//   final db = await Hive.openBox<ApplyCouponHiveModal>(AppStrings.couponDb);
//   final data = db.values.first;
//
//   return data;
// }
//
// Future<void> clearCoupon() async {
//   final db = await Hive.openBox<ApplyCouponHiveModal>(AppStrings.couponDb);
//   db.clear();
// }

///

Future<void> addToCart(HiveCartModal cartModal) async {
  final cartDb = await Hive.openBox<HiveCartModal>(AppStrings.cartDb);
  cartDb.add(cartModal);
}

Future<void> clearCartDb() async {
  final cartDb = await Hive.openBox<HiveCartModal>(AppStrings.cartDb);
  await cartDb.clear();
}

Future<List<HiveCartModal>> getData() async {
  final cartDb = await Hive.openBox<HiveCartModal>(AppStrings.cartDb);
  final data = cartDb.values;

  return data.toList();
}
