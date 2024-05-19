import 'package:json_annotation/json_annotation.dart';

import 'create_order_response_product_data/create_order_response_product_data.dart';

part 'product.g.dart';

@JsonSerializable()
class CrateOrderResponseProduct {
  CreateOrderResponseProductData? product;
  double? price;
  int? quantity;
  @JsonKey(name: '_id')
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;

  CrateOrderResponseProduct({
    this.product,
    this.price,
    this.quantity,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory CrateOrderResponseProduct.fromJson(Map<String, dynamic> json) {
    return _$CrateOrderResponseProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CrateOrderResponseProductToJson(this);
}
