// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      total: json['total'] as int?,
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      nextPage: json['nextPage'],
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'total': instance.total,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
      'nextPage': instance.nextPage,
    };
