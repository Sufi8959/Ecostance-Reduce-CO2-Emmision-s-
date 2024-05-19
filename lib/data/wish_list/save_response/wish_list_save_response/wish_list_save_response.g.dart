// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_save_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListSaveResponse _$WishListSaveResponseFromJson(
        Map<String, dynamic> json) =>
    WishListSaveResponse(
      wishlist: json['wishlist'] == null
          ? null
          : WishlistResponse.fromJson(json['wishlist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WishListSaveResponseToJson(
        WishListSaveResponse instance) =>
    <String, dynamic>{
      'wishlist': instance.wishlist,
    };
