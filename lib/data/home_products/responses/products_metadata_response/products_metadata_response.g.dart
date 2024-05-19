// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_metadata_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsMetadataResponse _$ProductsMetadataResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsMetadataResponse(
      total: json['total'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      nextPage: json['nextPage'],
    );

Map<String, dynamic> _$ProductsMetadataResponseToJson(
        ProductsMetadataResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'nextPage': instance.nextPage,
    };
