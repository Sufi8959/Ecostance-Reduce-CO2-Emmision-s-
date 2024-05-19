// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      exchange: json['exchange'] as String?,
      scale: json['scale'] as String?,
      id: json['id'] as String?,
      link: json['link'] as String?,
      participants: json['participants'] as String?,
      size: json['size'] as String?,
      start: json['start'] == null
          ? null
          : DateTime.tryParse(json['start'] as String),
      completion: json['completion'] as String?,
      validator: json['validator'] as String?,
      validatorLink: json['validatorLink'] as String?,
      monitor: json['monitor'] as String?,
      monitorNotes: json['monitorNotes'] as String?,
      monitorLink: json['monitorLink'] as String?,
      auditor: (json['auditor'] as List<dynamic>?)
          ?.map((e) => Auditor.fromJson(e as Map<String, dynamic>))
          .toList(),
      information: json['information'] as String?,
      owners:
          (json['owners'] as List<dynamic>?)?.map((e) => e as String).toList(),
      developers: json['developers'] as String?,
      funders: json['funders'] as String?,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'exchange': instance.exchange,
      'scale': instance.scale,
      'id': instance.id,
      'link': instance.link,
      'participants': instance.participants,
      'size': instance.size,
      'start': instance.start?.toIso8601String(),
      'completion': instance.completion,
      'validator': instance.validator,
      'validatorLink': instance.validatorLink,
      'monitor': instance.monitor,
      'monitorNotes': instance.monitorNotes,
      'monitorLink': instance.monitorLink,
      'auditor': instance.auditor,
      'information': instance.information,
      'owners': instance.owners,
      'developers': instance.developers,
      'funders': instance.funders,
    };
