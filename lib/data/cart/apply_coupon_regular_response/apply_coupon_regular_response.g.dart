// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_coupon_regular_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyCouponRegularResponse _$ApplyCouponRegularResponseFromJson(
        Map<String, dynamic> json) =>
    ApplyCouponRegularResponse(
      subTotal: (json['subTotal'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      stripePaymentCoupon: json['stripePaymentCoupon'] == null
          ? null
          : StripePaymentCoupon.fromJson(
              json['stripePaymentCoupon'] as Map<String, dynamic>),
      stripeSubscriptionCoupon: json['stripeSubscriptionCoupon'] == null
          ? null
          : StripeSubscriptionCoupon.fromJson(
              json['stripeSubscriptionCoupon'] as Map<String, dynamic>),
      orderTotalWithinStripeRange: json['orderTotalWithinStripeRange'] as bool?,
    );

Map<String, dynamic> _$ApplyCouponRegularResponseToJson(
        ApplyCouponRegularResponse instance) =>
    <String, dynamic>{
      'subTotal': instance.subTotal,
      'discount': instance.discount,
      'total': instance.total,
      'stripePaymentCoupon': instance.stripePaymentCoupon,
      'stripeSubscriptionCoupon': instance.stripeSubscriptionCoupon,
      'orderTotalWithinStripeRange': instance.orderTotalWithinStripeRange,
    };
