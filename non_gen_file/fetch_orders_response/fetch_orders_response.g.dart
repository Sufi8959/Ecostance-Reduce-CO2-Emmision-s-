// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchOrdersResponse _$FetchOrdersResponseFromJson(Map<String, dynamic> json) =>
    FetchOrdersResponse(
      success: json['success'] as bool?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FetchOrdersResponseToJson(
        FetchOrdersResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'metadata': instance.metadata,
      'data': instance.data,
    };
