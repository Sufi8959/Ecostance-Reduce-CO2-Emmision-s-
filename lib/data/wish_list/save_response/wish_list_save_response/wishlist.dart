import 'package:json_annotation/json_annotation.dart';

import 'product.dart';

part 'wishlist.g.dart';

@JsonSerializable()
class WishlistResponse {
  @JsonKey(name: '_id')
  String? id;
  String? customer;
  List<WishListProductResponse>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;

  WishlistResponse({
    this.id,
    this.customer,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    return _$WishlistResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WishlistResponseToJson(this);
}
