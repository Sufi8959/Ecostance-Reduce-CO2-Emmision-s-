// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrateOrderResponseProduct _$CrateOrderResponseProductFromJson(
        Map<String, dynamic> json) =>
    CrateOrderResponseProduct(
      product: json['product'] == null
          ? null
          : CreateOrderResponseProductData.fromJson(
              json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CrateOrderResponseProductToJson(
        CrateOrderResponseProduct instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
