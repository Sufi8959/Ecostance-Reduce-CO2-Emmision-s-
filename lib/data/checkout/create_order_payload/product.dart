import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class CreateOrderRequestProduct {
  String? product;
  double? price;
  int? quantity;
  String? currency;
  String? name;

  CreateOrderRequestProduct({this.product, this.price, this.quantity,this.currency,this.name});

  factory CreateOrderRequestProduct.fromJson(Map<String, dynamic> json) {
    return _$CreateOrderRequestProductFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateOrderRequestProductToJson(this);
}
