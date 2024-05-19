// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      sdgs: (json['sdgs'] as List<dynamic>?)
          ?.map((e) => Sdg.fromJson(e as Map<String, dynamic>))
          .toList(),
      standards: (json['standards'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      stdMethod: json['stdMethod'] == null
          ? null
          : StdMethod.fromJson(json['stdMethod'] as Map<String, dynamic>),
      estimatedAnnualEmissionReduction:
          json['estimatedAnnualEmissionReduction'] as String?,
      creditsIssued: json['creditsIssued'] as String?,
      operationRegistration: json['operationRegistration'] == null
          ? null
          : DateTime.tryParse(json['operationRegistration'] as String),
      termStart: json['termStart'] == null
          ? null
          : DateTime.tryParse(json['termStart'] as String),
      termEnd: json['termEnd'] == null
          ? null
          : DateTime.tryParse(json['termEnd'] as String),
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      landArea: json['landArea'] as String?,
      coBenifitsDescription: json['coBenifitsDescription'] as String?,
      documents: (json['documents'] as List<dynamic>?)
          ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'project': instance.project,
      'sdgs': instance.sdgs,
      'standards': instance.standards,
      'stdMethod': instance.stdMethod,
      'estimatedAnnualEmissionReduction':
          instance.estimatedAnnualEmissionReduction,
      'creditsIssued': instance.creditsIssued,
      'operationRegistration':
          instance.operationRegistration?.toIso8601String(),
      'termStart': instance.termStart?.toIso8601String(),
      'termEnd': instance.termEnd?.toIso8601String(),
      'location': instance.location,
      'landArea': instance.landArea,
      'coBenifitsDescription': instance.coBenifitsDescription,
      'documents': instance.documents,
    };
