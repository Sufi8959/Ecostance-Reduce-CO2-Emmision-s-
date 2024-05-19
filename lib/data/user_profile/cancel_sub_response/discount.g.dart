// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      id: json['id'] as String?,
      object: json['object'] as String?,
      checkoutSession: json['checkout_session'],
      coupon: json['coupon'] == null
          ? null
          : Coupon.fromJson(json['coupon'] as Map<String, dynamic>),
      customer: json['customer'] as String?,
      end: json['end'] as int?,
      invoice: json['invoice'],
      invoiceItem: json['invoice_item'],
      promotionCode: json['promotion_code'],
      start: json['start'] as int?,
      subscription: json['subscription'] as String?,
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'checkout_session': instance.checkoutSession,
      'coupon': instance.coupon,
      'customer': instance.customer,
      'end': instance.end,
      'invoice': instance.invoice,
      'invoice_item': instance.invoiceItem,
      'promotion_code': instance.promotionCode,
      'start': instance.start,
      'subscription': instance.subscription,
    };
