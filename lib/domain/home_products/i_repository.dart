import 'package:dartz/dartz.dart';
import 'package:net_carbons/data/core/general/failiure.dart';

abstract class IProductHomeRepository<T> {
  Future<Either<Failure, T>> getProducts(
      String? currency, String? keyWord, int page);
}
