import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/wish_list/response/wish_list_fetch_response/wish_list_fetch_response.dart';
import 'package:net_carbons/domain/wish_list/i_repository.dart';
import 'package:net_carbons/domain/wish_list/modals/modals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/dio.dart';
import '../save_response/wish_list_save_response/wish_list_save_response.dart';

class WishListRepo implements IWishListRepository {
  final dio = getIt<DioManager>();

  final sharedPref = getIt<SharedPreferences>();
  @override
  Future<Either<Failure, WishListLocalModal>> getWishList() async {
    List<String> list = [];
    if (sharedPref.containsKey(AppConstants.WISH_LIST_PREF_KEY)) {
      final strings = sharedPref.getStringList(AppConstants.WISH_LIST_PREF_KEY);
      strings?.forEach((element) {
        list.add(element);
      });
    }
    if (list.isNotEmpty) {
      return Right(WishListLocalModal(list: list));
    } else {
      return Left(Failure('no saved data'));
    }
  }

  @override
  Future<Either<Failure, WishListResponse>> getwishListFromServer() async {
    try {
      final resp = await dio.get('/v1/wishlists');

      if (resp.statusCode == 200) {
        final response = WishListResponse.fromJson(resp.data['data']);

        return Right(response);
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
    } catch (e) {
      print(e);
      return Left(ClientFailure(message: 'Unknown error in login')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<void> saveWishListToLocal(WishListLocalModal wishListModal) async {
    final list = wishListModal.list;
    await sharedPref.setStringList(AppConstants.WISH_LIST_PREF_KEY, list);
  }

  @override
  Future<Either<Failure, WishListSaveModal>> savewishListToServer(
      WishListLocalModal wishListModal) async {
    final data = wishListModal.list.map((e) => {'product': e}).toList();

    try {
      final resp = await dio.patch('/v1/wishlists', data: {'products': data});

      if (resp.statusCode == 200) {
        final response = WishListSaveResponse.fromJson(resp.data);

        return Right(response.toDomain());
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
    } catch (e) {
      return Left(ClientFailure(message: 'Unknown error in login')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }
}
