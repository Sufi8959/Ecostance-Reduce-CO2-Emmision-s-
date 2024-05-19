// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_certificate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCertificateResponse _$GetCertificateResponseFromJson(
        Map<String, dynamic> json) =>
    GetCertificateResponse(
      formattedNewOriginNumber: json['formattedNewOriginNumber'] as String?,
      originNumber: json['originNumber'] as String?,
      quantity: json['quantity'] as int?,
      project: json['project'] == null
          ? null
          : GetCertificateResponseProject.fromJson(
              json['project'] as Map<String, dynamic>),
      buyer: json['buyer'] == null
          ? null
          : GetCertificateResponseBuyer.fromJson(
              json['buyer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCertificateResponseToJson(
        GetCertificateResponse instance) =>
    <String, dynamic>{
      'formattedNewOriginNumber': instance.formattedNewOriginNumber,
      'originNumber': instance.originNumber,
      'quantity': instance.quantity,
      'project': instance.project,
      'buyer': instance.buyer,
    };
