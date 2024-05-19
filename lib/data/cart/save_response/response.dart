// import 'package:json_annotation/json_annotation.dart';
// part 'response.g.dart';
//
// @JsonSerializable()
// class CartSaveResponse {
//   CartSaveResponse({
//     this.cart,
//   });
//   @JsonKey(name: 'data')
//   CartResponse? cart;
//
//   factory CartSaveResponse.fromJson(Map<String, dynamic> json) =>
//       _$CartSaveResponseFromJson(json);
// }
//
// @JsonSerializable()
// class CartResponse {
//   CartResponse(
//       {this.id,
//       this.customer,
//       this.products,
//       this.createdAt,
//       this.updatedAt,
//       this.v,
//       this.stripePaymentCouponId,
//       this.coupon,
//       this.stripeSubscriptionCouponId});
//   @JsonKey(name: '_id')
//   String? id;
//   String? customer;
//   List<ProductCartSaveResponse>? products;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   @JsonKey(name: '__v')
//   int? v;
//   String? coupon;
//   String? stripePaymentCouponId;
//   String? stripeSubscriptionCouponId;
//
//   factory CartResponse.fromJson(Map<String, dynamic> json) =>
//       _$CartResponseFromJson(json);
// }
//
// @JsonSerializable()
// class ProductCartSaveResponse {
//   ProductCartSaveResponse({
//     this.product,
//     this.quantity,
//     this.status,
//     this.id,
//     this.updatedAt,
//     this.createdAt,
//   });
//
//   String? product;
//   int? quantity;
//   int? status;
//   String? id;
//   DateTime? updatedAt;
//   DateTime? createdAt;
//
//   factory ProductCartSaveResponse.fromJson(Map<String, dynamic> json) =>
//       _$ProductCartSaveResponseFromJson(json);
// }
