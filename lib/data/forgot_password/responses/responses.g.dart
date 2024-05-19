// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRespons _$ResetPasswordResponsFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRespons(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResetPasswordResponsToJson(
        ResetPasswordRespons instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

OtpSubmitResponse _$OtpSubmitResponseFromJson(Map<String, dynamic> json) =>
    OtpSubmitResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$OtpSubmitResponseToJson(OtpSubmitResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
