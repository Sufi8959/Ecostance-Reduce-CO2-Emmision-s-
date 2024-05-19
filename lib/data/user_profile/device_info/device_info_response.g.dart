// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfoResponse _$DeviceInfoResponseFromJson(Map<String, dynamic> json) =>
    DeviceInfoResponse(
      ua: json['ua'] as String?,
      browser: json['browser'] == null
          ? null
          : Browser.fromJson(json['browser'] as Map<String, dynamic>),
      engine: json['engine'] == null
          ? null
          : Engine.fromJson(json['engine'] as Map<String, dynamic>),
      os: json['os'] == null
          ? null
          : Engine.fromJson(json['os'] as Map<String, dynamic>),
      device: json['device'] == null
          ? null
          : Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeviceInfoResponseToJson(DeviceInfoResponse instance) =>
    <String, dynamic>{
      'ua': instance.ua,
      'browser': instance.browser,
      'engine': instance.engine,
      'os': instance.os,
      'device': instance.device,
    };
