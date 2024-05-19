// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sdg _$SdgFromJson(Map<String, dynamic> json) => Sdg(
      sdgDetails: json['sdg'] == null
          ? null
          : SdgDetails.fromJson(json['sdg'] as Map<String, dynamic>),
      details: json['details'] as String?,
      fulFilled: json['fulFilled'] as bool?,
    );

Map<String, dynamic> _$SdgToJson(Sdg instance) => <String, dynamic>{
      'sdg': instance.sdgDetails,
      'details': instance.details,
      'fulFilled': instance.fulFilled,
    };
