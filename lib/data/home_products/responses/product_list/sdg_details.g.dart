// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdg_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SdgDetails _$SdgDetailsFromJson(Map<String, dynamic> json) => SdgDetails(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      imageInvert: json['imageInvert'] as String?,
      v: json['__v'] as int?,
      index: json['index'] as int?,
    );

Map<String, dynamic> _$SdgDetailsToJson(SdgDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'imageInvert': instance.imageInvert,
      '__v': instance.v,
      'index': instance.index,
    };
