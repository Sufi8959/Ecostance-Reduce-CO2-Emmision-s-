import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class WishListProductResponse {
  String? product;
  @JsonKey(name: '_id')
  String? id;
  DateTime? updatedAt;
  DateTime? createdAt;

  WishListProductResponse(
      {this.product, this.id, this.updatedAt, this.createdAt});

  factory WishListProductResponse.fromJson(Map<String, dynamic> json) {
    return _$WishListProductResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WishListProductResponseToJson(this);
}
