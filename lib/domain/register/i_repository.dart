import 'package:dartz/dartz.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/register/repository/repository.dart';

abstract class IRegisterRepository<T> {
  Future<Either<Failure, T>> register(RegisterRequest registerRequest);
  Future<Either<Failure, T>> verifyWithOtp(OtpVerifyRequest otpVerifyRequest);
  Future<Either<Failure, T>> verifyToken(String token);

  Future<Either<Failure, T>> resendOtp(String email);
}
