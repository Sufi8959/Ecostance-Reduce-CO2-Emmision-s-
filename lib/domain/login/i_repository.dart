import 'package:dartz/dartz.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/domain/auth/model/modals.dart';

abstract class ILoginRepository<T> {
  Future<Either<Failure, T>> login(LoginRequest loginRequest);
  Future<Either<Failure, T>> setCurrency(String currency);
  Future<Either<Failure, T>> verifyToken();
  Future<Either<Failure, T>> updateFcmToken(String token);

  Future<Either<T, T>> checkHasUser();
  Future<void> saveUser(AuthDataModal authDataModal);
  Future<void> clearUser();
}
