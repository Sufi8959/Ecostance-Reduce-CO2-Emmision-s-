import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/forgot_password/responses/responses.dart';
import 'package:net_carbons/domain/forgot_password/i_repository.dart';
import 'package:net_carbons/domain/forgot_password/modal/resp_modal.dart';

class ForgotPasswordRepository implements IForgotPassword {
  final dio = getIt<DioManager>();

  @override
  Future<Either<Failure, ForgotPassRespModal>> requestOtp(String email) async {
    try {
      final resp = await dio.patch('/auth/otp-reset-password', data: {
        'email': email,
      });
      if (resp.statusCode == 200) {
        final response = ResetPasswordRespons.fromJson(resp.data);
        return Right(response.toDomain());
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(
              message: e.response?.data['message'] ?? "Error in generating Otp")
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ClientFailure(message: "Error in generating Otp")
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> submitOtpAndGetToken(
      String email, String otp) async {
    try {
      final resp = await dio
          .patch('/auth/otp-verify', data: {"email": email, "otp": otp});
      if (resp.statusCode == 200) {
        final response = OtpSubmitResponse.fromJson(resp.data);
        return Right(response.toDomainSuccess());
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.response?.data['message'])
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changePassword(String token, String password,
      String confirmPassword, String currentPassword) async {
    try {
      final resp = await dio.post(
        '/auth/reset-password?tk=$token',
        data: {
          'currentPassword': currentPassword,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );
      if (resp.statusCode == 200) {
        return Right(OtpChangePasswordResponseModalSuccess(
            message: 'Password changed successfully'));
      } else {
        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } catch (e) {
      return Left(ClientFailure(message: e.toString())
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<Either<Failure, dynamic>> resendOtp(String email) async {
    try {
      final resp = await dio.patch('/auth/resend-otp-reset-password',
          data: {'email': email, "origin": "mobile"});
      if (resp.statusCode == 200) {
        return Right(resp.data);
      } else {
        return Left(ServerFailure(message: "Result Error"));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ServerFailure(message: "Dio Error"));
    } catch (e) {
      return Left(ServerFailure(message: "Client   Error"));
    }
  }
}
