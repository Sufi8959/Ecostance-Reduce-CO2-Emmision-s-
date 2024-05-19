// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      products: (json['data'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadataResponse: json['metadata'] == null
          ? null
          : ProductsMetadataResponse.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'data': instance.products,
      'metadata': instance.metadataResponse,
    };
