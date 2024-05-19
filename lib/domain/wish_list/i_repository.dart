import 'package:dartz/dartz.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/domain/wish_list/modals/modals.dart';

abstract class IWishListRepository<T> {
  Future<Either<Failure, dynamic>> getWishList();
  Future<void> saveWishListToLocal(WishListLocalModal wishListModal);

  Future<Either<Failure, dynamic>> getwishListFromServer();
  Future<Either<Failure, dynamic>> savewishListToServer(
      WishListLocalModal wishListModal);
}
