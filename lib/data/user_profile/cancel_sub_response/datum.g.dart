// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as String?,
      object: json['object'] as String?,
      billingThresholds: json['billing_thresholds'],
      created: json['created'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
      price: json['price'] == null
          ? null
          : Price.fromJson(json['price'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      subscription: json['subscription'] as String?,
      taxRates: json['tax_rates'] as List<dynamic>?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'billing_thresholds': instance.billingThresholds,
      'created': instance.created,
      'metadata': instance.metadata,
      'plan': instance.plan,
      'price': instance.price,
      'quantity': instance.quantity,
      'subscription': instance.subscription,
      'tax_rates': instance.taxRates,
    };
