import 'package:dartz/dartz.dart';
import 'package:net_carbons/data/core/general/failiure.dart';

abstract class ISingleProductRepository<T> {
  Future<Either<Failure, T>> fetchProductData(
      String productId, String currency);
  Future<Either<Failure, T>> fetchReviews(String productId);

  Future<Either<Failure, T>> fetchProductForCalculator(String currency);
}
