// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_fetch_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListResponse _$WishListResponseFromJson(Map<String, dynamic> json) =>
    WishListResponse(
      id: json['_id'] as String?,
      customer: json['customer'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductWishElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['v'] as int?,
    );

Map<String, dynamic> _$WishListResponseToJson(WishListResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'customer': instance.customer,
      'products': instance.products,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
    };

ProductWishElement _$ProductWishElementFromJson(Map<String, dynamic> json) =>
    ProductWishElement(
      product: json['product'] == null
          ? null
          : WishlistProductData.fromJson(
              json['product'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ProductWishElementToJson(ProductWishElement instance) =>
    <String, dynamic>{
      'product': instance.product,
      '_id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
