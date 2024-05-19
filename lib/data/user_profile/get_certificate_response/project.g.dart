// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCertificateResponseProject _$GetCertificateResponseProjectFromJson(
        Map<String, dynamic> json) =>
    GetCertificateResponseProject(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      number: json['number'] as String?,
      state: json['state'] as String?,
      standards: (json['standards'] as List<dynamic>?)
          ?.map((e) => GetCertificateResponseStandard.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      intermediaries: json['intermediaries'] as List<dynamic>?,
    );

Map<String, dynamic> _$GetCertificateResponseProjectToJson(
        GetCertificateResponseProject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'number': instance.number,
      'state': instance.state,
      'standards': instance.standards,
      'intermediaries': instance.intermediaries,
    };
