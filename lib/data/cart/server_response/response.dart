import 'package:json_annotation/json_annotation.dart';
import 'package:net_carbons/data/wish_list/response/wishlist_product_data/wishlist_product_data.dart';
part 'response.g.dart';

class CartServerResponseMain {
  CartServerResponseMain({
    this.success,
    this.data,
  });

  bool? success;
  CartServerResponse? data;

  factory CartServerResponseMain.fromJson(Map<String, dynamic> json) =>
      CartServerResponseMain(
        success: json["success"] != null ? json['success'] : null,
        data: CartServerResponse.fromJson(json["data"]),
      );
}

@JsonSerializable()
class CartServerResponse {
  CartServerResponse(
      {this.id,
      this.customer,
      this.products,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.stripePaymentCouponId,
      this.coupon,
      this.stripeSubscriptionCouponId,
      this.orderTotal,
      this.subTotal,
      this.discount,
      this.discountUnit,
      this.couponType,
      this.orderTotalWithinStripeRange,this.temporaryCheckoutCurrency});
  @JsonKey(name: '_id')
  String? id;
  CartCustomerDataResponse? customer;
  List<CartServerProductElementResponse>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  String? coupon;
  String? stripePaymentCouponId;
  String? stripeSubscriptionCouponId;
  double? discount;
  double? orderTotal;
  double? subTotal;
  double? discountUnit;
  String? couponType;
  bool? orderTotalWithinStripeRange;
  String? temporaryCheckoutCurrency;

  factory CartServerResponse.fromJson(Map<String, dynamic> json) =>
      _$CartServerResponseFromJson(json);
}

@JsonSerializable()
class CartCustomerDataResponse {
  CartCustomerDataResponse({
     this.checkoutDefaultCurrency,
  });

  final String? checkoutDefaultCurrency;
  factory CartCustomerDataResponse.fromJson(
      Map<String, dynamic> json) =>
      _$CartCustomerDataResponseFromJson(json);
}


@JsonSerializable()
class CartServerProductElementResponse {
  CartServerProductElementResponse({
    this.product,
    this.quantity,
    this.status,
    this.id,
    this.updatedAt,
    this.createdAt,
  });

  WishlistProductData? product;
  int? quantity;
  int? status;
  @JsonKey(name: '_id')
  String? id;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory CartServerProductElementResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CartServerProductElementResponseFromJson(json);
}

@JsonSerializable()
class CartServerResponseProductIdResponse {
  CartServerResponseProductIdResponse({
    required this.id,
  });
  @JsonKey(name: '_id')
  String id;

  factory CartServerResponseProductIdResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CartServerResponseProductIdResponseFromJson(json);
}
