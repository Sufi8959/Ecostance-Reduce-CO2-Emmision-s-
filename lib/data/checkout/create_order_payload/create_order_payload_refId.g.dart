// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_payload_refId.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


CreateOrderPayloadRefId _$CreateOrderRefIdPayloadFromJson(Map<String, dynamic> json) =>
    CreateOrderPayloadRefId(
      products: (json['products'] as List<dynamic>)
          .map((e) =>
              CreateOrderRequestProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toDouble(),
      address: json['address'] == null
          ? null
          : CreateOrderRequestAddress.fromJson(
              json['address'] as Map<String, dynamic>),
      paymentStatus: json['paymentStatus'] as String,
      paymentMethod: json['paymentMethod'] as String,
      couponCode: json['couponCode'] as String?,
      type: json['type'] as String,
      customer: json['customer'] as String,
      orderTotal: (json['orderTotal'] as num).toDouble(),
      currency: json['currency'] as String,
      currencySymbol: json['currencySymbol'] as String,
      paymentMode: json['paymentMode'] as String,
      origin: json['origin'] as String,
      sessionId: json['sessionId'] as String,
          referalUserId: json['referalUserId'] as String,
      paymentLogs: json['paymentLogs'] as List<dynamic>,
    );

Map<String, dynamic> _$CreateOrderRefIdPayloadToJson(CreateOrderPayloadRefId instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'address': instance.address,
      'paymentStatus': instance.paymentStatus,
      'paymentMethod': instance.paymentMethod,
      'couponCode': instance.couponCode,
      'type': instance.type,
      'origin': instance.origin,
      'sessionId': instance.sessionId,
      'referalUserId': instance.referalUserId,
      'customer': instance.customer,
      'orderTotal': instance.orderTotal,
      'currency': instance.currency,
      'currencySymbol': instance.currencySymbol,
      'paymentMode': instance.paymentMode,
      'paymentLogs': instance.paymentLogs,
    };
