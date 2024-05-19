// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationResponse _$AuthenticationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponse(
      user: json['user'] == null
          ? null
          : UserModelResponse.fromJson(json['user'] as Map<String, dynamic>),
      ip: json['ip'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthenticationResponseToJson(
        AuthenticationResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'ip': instance.ip,
      'token': instance.token,
    };
