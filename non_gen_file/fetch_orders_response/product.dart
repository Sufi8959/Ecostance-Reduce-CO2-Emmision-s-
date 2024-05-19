import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  Product? product;
  int? price;
  int? quantity;
  String? certificateNumber;
  @JsonKey(name: '_id')
  String? id;
  DateTime? updatedAt;
  DateTime? createdAt;

  Product({
    this.product,
    this.price,
    this.quantity,
    this.certificateNumber,
    this.id,
    this.updatedAt,
    this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
