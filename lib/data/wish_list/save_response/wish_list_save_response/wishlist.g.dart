// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistResponse _$WishlistResponseFromJson(Map<String, dynamic> json) =>
    WishlistResponse(
      id: json['_id'] as String?,
      customer: json['customer'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              WishListProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$WishlistResponseToJson(WishlistResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'customer': instance.customer,
      'products': instance.products,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
    };
