// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Standard _$StandardFromJson(Map<String, dynamic> json) => Standard(
      id: json['_id'] as String?,
      standardId: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      companyWebsite: json['companyWebsite'] as String?,
      methodology: json['methodology'] as String?,
      logo: json['logo'] as String?,
      link: json['link'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$StandardToJson(Standard instance) => <String, dynamic>{
      '_id': instance.id,
      'id': instance.standardId,
      'type': instance.type,
      'name': instance.name,
      'companyWebsite': instance.companyWebsite,
      'methodology': instance.methodology,
      'logo': instance.logo,
      'link': instance.link,
      'description': instance.description,
    };
