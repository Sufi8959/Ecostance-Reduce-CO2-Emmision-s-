import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/login/authentication_response/authentication_response.dart';
import 'package:net_carbons/data/register/register_response/register_response.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';
import 'package:net_carbons/domain/register/i_repository.dart';
import 'package:net_carbons/domain/register/modal/RegisterRespModal.dart';

class RegisterRepository implements IRegisterRepository {
  final dio = getIt<DioManager>();
  @override
  Future<Either<Failure, RegisterRespModal>> register(
      RegisterRequest registerRequest) async {
    try {
      final resp = await dio.post('/auth/register', data: {
        'email': registerRequest.email,
        'password': registerRequest.password,
        'confirmPassword': registerRequest.confirmPassword,
        'origin': "mobile",
        "termsAndConditions": true,
        "newsLetter": registerRequest.newsLetter
      },
          additionalHeaders: {
          'device': "${Platform.isIOS ? 'iOS' : 'Android'} Mobile"
          });
      if (resp.statusCode == 200) {
        final RegisterResponse response = RegisterResponse.fromJson(resp.data);
        return Right(response.toDomain());
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(
              message: e.response?.data['message'] ?? "Error in connection ")
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpResponseModal>> verifyWithOtp(
      OtpVerifyRequest otpVerifyRequest) async {
    try {
      final resp = await dio.patch('/auth/registration-otp-verify', data: {
        'email': otpVerifyRequest.email,
        'otp': otpVerifyRequest.otp,
      });

      if (resp.statusCode == 200) {
        final response = OtpVerifyResponse.fromJson(resp.data);
        return Right(response.toDomain());
      } else {
        FirebaseCrashlytics.instance
            .recordError(resp, StackTrace.current, information: [
          resp?.data,
          {"code": resp?.statusCode.toString()}
        ]);
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on DioError catch (e) {
      FirebaseCrashlytics.instance
          .recordError(e, StackTrace.current, information: [
        e.response?.data,
        {"code": e.response?.statusCode.toString()}
      ]);
      return Left(
          ClientFailure(message: e.response?.data['message'] ?? "Error"));
    } catch (e) {
      FirebaseCrashlytics.instance
          .recordError(e, StackTrace.current, information: [
        e.toString(),
        {"code": "NOT DIO"}
      ]);
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, AuthDataModal>> verifyToken(String token) async {
    try {
      final resp =
          await dio.get('/auth/verify-account', queryParameters: {"tk": token});
      if (resp.statusCode == 200) {
        final response = AuthenticationResponse.fromJson(resp.data);

        return Right(response.toDomain());
      } else {
        return Left(ServerFailure(message: "Result Error"));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(
          ServerFailure(message: e.response?.data['message'] ?? "Error"));
    } catch (e) {
      return Left(ServerFailure(message: "Client   Error"));
    }
  }

  @override
  Future<Either<Failure, dynamic>> resendOtp(String email,
      {bool? checkout}) async {
    try {
      final resp = await dio.patch('/auth/resend-otp-register',
          data: {'email': email, "origin": "mobile", "checkout": checkout});
      if (resp.statusCode == 200) {
        return Right(resp.data);
      } else {
        return Left(ServerFailure(message: "Result Error"));
      }
      print("============resendOtp ================");
      return Left(ServerFailure(message: "Dio Error"));
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ServerFailure(message: "Dio Error"));
    } catch (e) {
      return Left(ServerFailure(message: "Client   Error"));
    }
  }
}

class RegisterRequest {
  final String email;
  final String password;
  final String confirmPassword;
  final bool newsLetter;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.newsLetter,
  });
}

class OtpVerifyRequest {
  final String email;
  final String otp;
  OtpVerifyRequest(this.email, this.otp);
}
