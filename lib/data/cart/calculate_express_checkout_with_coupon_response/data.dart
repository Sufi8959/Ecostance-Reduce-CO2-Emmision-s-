import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class CalculateExpressCheckoutWithCouponResponse {
  String? coupon;
  int? discountUnit;
  String? couponType;
  String? stripePaymentCouponId;
  String? stripeSubscriptionCouponId;
  double? discount;
  double? orderTotal;
  double? subTotal;

  CalculateExpressCheckoutWithCouponResponse({
    this.coupon,
    this.discountUnit,
    this.couponType,
    this.stripePaymentCouponId,
    this.stripeSubscriptionCouponId,
    this.discount,
    this.orderTotal,
    this.subTotal,
  });

  factory CalculateExpressCheckoutWithCouponResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CalculateExpressCheckoutWithCouponResponseFromJson(json);
}
