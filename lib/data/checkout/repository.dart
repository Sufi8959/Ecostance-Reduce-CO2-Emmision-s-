import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/checkout/create_order_payload/create_order_payload.dart';
import 'package:net_carbons/data/checkout/create_order_payload/create_order_payload_refId.dart';
import 'package:net_carbons/data/checkout/create_order_response/create_order_response.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/app_api.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/domain/checkout/ICheckout_repo.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/order.dart'
    as order;
import 'package:net_carbons/domain/user_profile/modal/my_orders_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutRepository implements ICheckoutRepository {
  final appApi = getIt<AppApi>();
  final dio = getIt<DioManager>();
  @override
  Future<Either<Failure, CreateOrderResponse>> createOrder(
      CreateOrderPayload createOrderRequest) async {
    try {
      final data = createOrderRequest.toJson();
      log("createOrder ---> ${jsonEncode(data)}");
      final resp = await dio.post("/v1/orders", data: data);

      if (resp.statusCode == 200) {
        return Right(CreateOrderResponse.fromJson(resp.data));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.response?.data['message'] ?? '')
          .orGeneric("Something went wrong. Please contact support."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please contact support."));
    }
  }

  @override
  Future<Either<Failure, OrderFetchModal>> getOnOrder(
      String orderId, String currency) async {
    final res = await appApi.apiGet(endpoint: '/v1/orders/$orderId');
    return res.fold((l) {
      return Left(ClientFailure(message: l.message));
    }, (r) {
      final result = order.Order.fromJson(r.data['data']);
      return Right(result.toDomain(currency));
    });
  }

  @override
  Future<Either<Failure, CreateOrderResponse>> createOrderRefId(
      CreateOrderPayloadRefId createOrderRequest) async {
    try {
      final data = createOrderRequest.toJson();
      log(jsonEncode(data));
      final resp = await dio.post("/v1/orders", data: data);

      if (resp.statusCode == 200) {
        var prefs = await SharedPreferences.getInstance();
        prefs.remove('deep_link_data');
        return Right(CreateOrderResponse.fromJson(resp.data));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.response?.data['message'] ?? '')
          .orGeneric("Something went wrong. Please contact support."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please contact support."));
    }
  }
}
