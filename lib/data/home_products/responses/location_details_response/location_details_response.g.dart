// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetails _$LocationDetailsFromJson(Map<String, dynamic> json) =>
    LocationDetails(
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      degreeDecimal: json['degreeDecimal'] == null
          ? null
          : DegreeDecimal.fromJson(
              json['degreeDecimal'] as Map<String, dynamic>),
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => LocationImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationDetailsToJson(LocationDetails instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
      'degreeDecimal': instance.degreeDecimal,
      'description': instance.description,
      'images': instance.images,
    };
