// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_response_product_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderResponseProductData _$CreateOrderResponseProductDataFromJson(
        Map<String, dynamic> json) =>
    CreateOrderResponseProductData(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      productId: (json['id'] as int?).toString(),
    );

Map<String, dynamic> _$CreateOrderResponseProductDataToJson(
        CreateOrderResponseProductData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'id': instance.productId,
    };
