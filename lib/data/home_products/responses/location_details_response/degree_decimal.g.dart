// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'degree_decimal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DegreeDecimal _$DegreeDecimalFromJson(Map<String, dynamic> json) =>
    DegreeDecimal(
      type: json['type'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$DegreeDecimalToJson(DegreeDecimal instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };
