// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_subscription_coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StripeSubscriptionCoupon _$StripeSubscriptionCouponFromJson(
        Map<String, dynamic> json) =>
    StripeSubscriptionCoupon(
      id: json['id'] as String?,
      object: json['object'] as String?,
      amountOff: (json['amount_off'] as num?)?.toDouble(),
      created: json['created'] as int?,
      currency: json['currency'] as String?,
      duration: json['duration'] as String?,
      durationInMonths: json['duration_in_months'] as int?,
      livemode: json['livemode'] as bool?,
      maxRedemptions: json['max_redemptions'],
      name: json['name'] as String?,
      percentOff: json['percent_off'],
      redeemBy: json['redeem_by'],
      timesRedeemed: json['times_redeemed'] as int?,
      valid: json['valid'] as bool?,
    );

Map<String, dynamic> _$StripeSubscriptionCouponToJson(
        StripeSubscriptionCoupon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'amount_off': instance.amountOff,
      'created': instance.created,
      'currency': instance.currency,
      'duration': instance.duration,
      'duration_in_months': instance.durationInMonths,
      'livemode': instance.livemode,
      'max_redemptions': instance.maxRedemptions,
      'name': instance.name,
      'percent_off': instance.percentOff,
      'redeem_by': instance.redeemBy,
      'times_redeemed': instance.timesRedeemed,
      'valid': instance.valid,
    };
