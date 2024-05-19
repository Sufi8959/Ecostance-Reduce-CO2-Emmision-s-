import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/home_products/responses/products_metadata_response/products_metadata_response.dart';

import 'product.dart';

part 'product_list.g.dart';

@JsonSerializable()
class ProductList {
  @JsonKey(name: 'data')
  List<Product>? products;
  @JsonKey(name: 'metadata')
  ProductsMetadataResponse? metadataResponse;

  ProductList({this.products, this.metadataResponse});

  factory ProductList.fromJson(Map<String, dynamic> json) {
    final res = _$ProductListFromJson(json);

    return res;
  }

  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}
