import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/home_products/responses/product_list/product.dart';
import 'package:net_carbons/data/product/product_review_response/product_review_response.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/domain/product/i_repository.dart';
import 'package:net_carbons/domain/product/modal/review_modals.dart';

class SingleProductRepository implements ISingleProductRepository {
  final dio = getIt<DioManager>();

  @override
  Future<Either<Failure, ProductModal>> fetchProductData(
      String productId, String currency) async {
    try {
      final resp = await dio.get('/v1/products/$productId');

      if (resp.statusCode == 200) {
        final response = Product.fromJson(resp.data['data']);

        return Right(response.toDomain(currency));
      } else {
        return Left(ServerFailure(message: "Unable To Get Data"));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ServerFailure(message: e.response.toString()));
    } catch (e) {
      return Left(ServerFailure(message: "Unknown Error"));
    }
  }

  @override
  Future<Either<Failure, ProductReviewListModal>> fetchReviews(
      String productId) async {
    try {
      ///TODO Change ti variable
      final resp = await dio.get('/v1/review/$productId/product');

      if (resp.statusCode == 200) {
        final response = ProductReviewResponse.fromJson(resp.data);

        return Right(response.toDomain());
      } else {
        return Left(ServerFailure(message: "Unable To Get Data"));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ServerFailure(message: e.response.toString()));
    } catch (e) {
      print(e);
      return Left(ServerFailure(message: "Unknown Error"));
    }
  }

  @override
  Future<Either<Failure, ProductModal>> fetchProductForCalculator(
      String currency) async {
    try {
      final resp = await dio.get('/v1/products/lowest/price?showDetails=0');

      if (resp.statusCode == 200) {
        final response = Product.fromJson(resp.data['data']);

        return Right(response.toDomain(currency));
      } else {
        return Left(ServerFailure(message: "Unable To Get Data"));
      }
    } on DioError catch (e) {
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ServerFailure(message: e.response.toString()));
    } catch (e) {
      return Left(ServerFailure(message: "Unknown Error"));
    }
  }
}
