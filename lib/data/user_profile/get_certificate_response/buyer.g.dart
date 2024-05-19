// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCertificateResponseBuyer _$GetCertificateResponseBuyerFromJson(
        Map<String, dynamic> json) =>
    GetCertificateResponseBuyer(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      pincode: json['pincode'] as String?,
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.tryParse(json['deliveryDate'] as String),
      transactionId: json['transactionId'] as String?,
    );

Map<String, dynamic> _$GetCertificateResponseBuyerToJson(
        GetCertificateResponseBuyer instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'transactionId': instance.transactionId,
    };
