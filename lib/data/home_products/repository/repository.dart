import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/home_products/responses/product_list/product_list.dart';

import '../../../domain/home_products/i_repository.dart';
import '../../../domain/home_products/modal/models.dart';
import '../../core/network/dio.dart';

class ProductsRepository implements IProductHomeRepository {
  final dio = getIt<DioManager>();
  @override
  Future<Either<Failure, ProductsListModal>> getProducts(
      String? currency, String? keyWord, int page) async {
    print("===============$page");
    try {
      final resp = await dio.get('/v1/products',
          queryParameters: {
            "search": keyWord,
            "page": page,
            "size": 4,
            "shouldPaginate": 1
          },
          timeOut: const Duration(milliseconds: 90000));
      print("Error 27 home_products");
      // print(resp.data['data'][0]['docLinks']);
      if (resp.statusCode == 200) {
        final response = ProductList.fromJson(resp.data);
        print("Error 31 home_products");
        final data = response.toDomain(currency ?? "USD");
        return Right(data);
      } else {
        print("Error 35 home_products");

        return Left(ServerFailure(message: resp.data['message'])
            .orGeneric("Something went wrong. Please try again later."));
      }
    } on DioError catch (e) {
      print("Error 41 home_products");
      print(e);
      return Left(ClientFailure(message: 'Error in getting products')
          .orGeneric("Something went wrong. Please try again later."));
    } catch (e) {
      print("Error 46 home_products");
      print(e);
      return Left(ClientFailure(message: 'Unknown error in products')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }
}
