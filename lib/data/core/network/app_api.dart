import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/network/dio.dart';

class AppApi {
  final DioManager dio;

  AppApi({required this.dio});

  Future<Either<Failure, Response<dynamic>>> apiGet(
      {required String endpoint, Map<String, dynamic>? queryParameters}) async {
    try {
      final resp = await dio.get(endpoint, queryParameters: queryParameters);

      if (resp.statusCode == 200) {
        return Right(resp);
      } else if (resp.statusCode == 404) {
        return Left(ClientFailure(message: 'not found'));
      } else if (resp.statusCode == 403) {
        return Left(UnAuthorizedFailure(resp.statusMessage));
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);

      return Left(ClientFailure(message: e.message)
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  Future<Either<Failure, Response<dynamic>>> apiPost(
      {required String endpoint, required Map<String, dynamic> data}) async {
    try {
      final resp = await dio.post(endpoint, data: data);

      if (resp.statusCode == 200) {
        return Right(resp);
      } else if (resp.statusCode == 403) {
        return Left(UnAuthorizedFailure(resp.data['message']));
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(
          ClientFailure(message: e.response?.data['message'] ?? 'Unknown error')
              .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  Future<Either<Failure, Response<dynamic>>> apiPatch(
      {required String endpoint,
      Map<String, dynamic>? data,
      Map<String, dynamic>? params}) async {
    try {
      final resp = await dio.patch(endpoint, data: data, params: params);

      if (resp.statusCode == 200) {
        return Right(resp);
      } else if (resp.statusCode == 403) {
        return Left(UnAuthorizedFailure(resp.statusMessage));
      } else if (resp.statusCode == 401) {
        return Left(AccountHold(message: resp.data['message']));
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(
          ClientFailure(message: e.response?.data['message'] ?? 'UNKNOWN ERROR')
              .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }
}
