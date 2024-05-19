// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_sub_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelSubResponse _$CancelSubResponseFromJson(Map<String, dynamic> json) =>
    CancelSubResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CancelSubResponseToJson(CancelSubResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
