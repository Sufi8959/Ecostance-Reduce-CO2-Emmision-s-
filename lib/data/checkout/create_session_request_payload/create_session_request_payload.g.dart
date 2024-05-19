// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_session_request_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSessionRequestPayload _$CreateSessionRequestPayloadFromJson(
        Map<String, dynamic> json) =>
    CreateSessionRequestPayload(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      discounts: (json['discounts'] as List<dynamic>)
          .map((e) => Discount.fromJson(e as Map<String, dynamic>))
          .toList(),
      email: json['email'] as String?,
      paymentMode: json['paymentMode'] as String?,
    );

Map<String, dynamic> _$CreateSessionRequestPayloadToJson(
        CreateSessionRequestPayload instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'discounts': instance.discounts.map((e) => e.toJson()).toList(),
      'email': instance.email,
      'paymentMode': instance.paymentMode,
    };
