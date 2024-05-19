// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalculateExpressCheckoutWithCouponResponse
    _$CalculateExpressCheckoutWithCouponResponseFromJson(
            Map<String, dynamic> json) =>
        CalculateExpressCheckoutWithCouponResponse(
          coupon: json['coupon'] as String?,
          discountUnit: json['discountUnit'] as int?,
          couponType: json['couponType'] as String?,
          stripePaymentCouponId: json['stripePaymentCouponId'] as String?,
          stripeSubscriptionCouponId:
              json['stripeSubscriptionCouponId'] as String?,
          discount: (json['discount'] as num?)?.toDouble(),
          orderTotal: (json['orderTotal'] as num?)?.toDouble(),
          subTotal: (json['subTotal'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$CalculateExpressCheckoutWithCouponResponseToJson(
        CalculateExpressCheckoutWithCouponResponse instance) =>
    <String, dynamic>{
      'coupon': instance.coupon,
      'discountUnit': instance.discountUnit,
      'couponType': instance.couponType,
      'stripePaymentCouponId': instance.stripePaymentCouponId,
      'stripeSubscriptionCouponId': instance.stripeSubscriptionCouponId,
      'discount': instance.discount,
      'orderTotal': instance.orderTotal,
      'subTotal': instance.subTotal,
    };
