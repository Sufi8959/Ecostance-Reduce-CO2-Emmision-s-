// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'certificate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Certificate _$CertificateFromJson(Map<String, dynamic> json) => Certificate(
      id: json['_id'] as String?,
      originNumber: json['originNumber'] as String?,
      customer: json['customer'] as String?,
      userCertificateSlug: json['userCertificateSlug'] as String?,
      order: json['order'] as String?,
      product: json['product'] as String?,
      certificateUrl: json['certificateURL'] as String?,
      status: json['status'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$CertificateToJson(Certificate instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'originNumber': instance.originNumber,
      'customer': instance.customer,
      'userCertificateSlug': instance.userCertificateSlug,
      'order': instance.order,
      'product': instance.product,
      'certificateURL': instance.certificateUrl,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'transactionId': instance.transactionId,
    };
