// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_fetch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderFetchResponse _$OrderFetchResponseFromJson(Map<String, dynamic> json) =>
    OrderFetchResponse(
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      orders: (json['data'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderFetchResponseToJson(OrderFetchResponse instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'data': instance.orders,
    };
