import 'package:dartz/dartz.dart';
import 'package:net_carbons/data/core/general/failiure.dart';

abstract class IForgotPassword<T> {
  Future<Either<Failure, T>> requestOtp(String email);
  Future<Either<Failure, T>> submitOtpAndGetToken(String email, String otp);
  Future<Either<Failure, T>> changePassword(String token, String password,
      String confirmPassword, String currentPassword);
  Future<Either<Failure, dynamic>> resendOtp(String email);
}
