// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      description: json['description'] as String?,
      lang: json['lang'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'description': instance.description,
      'lang': instance.lang,
    };
