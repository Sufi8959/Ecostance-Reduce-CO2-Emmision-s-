// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListProductResponse _$WishListProductResponseFromJson(
        Map<String, dynamic> json) =>
    WishListProductResponse(
      product: json['product'] as String?,
      id: json['_id'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
    );

Map<String, dynamic> _$WishListProductResponseToJson(
        WishListProductResponse instance) =>
    <String, dynamic>{
      'product': instance.product,
      '_id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
