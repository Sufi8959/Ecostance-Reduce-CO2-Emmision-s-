// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductElement _$OrderProductElementFromJson(Map<String, dynamic> json) =>
    OrderProductElement(
      product: json['product'] == null
          ? null
          : FetchOrderProductData.fromJson(
              json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toDouble(),
      quantity: json['quantity'] as int?,
      certificate: json['certificate'] == null
          ? null
          : OrderProductCertificateResponse.fromJson(
              json['certificate'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
    );

Map<String, dynamic> _$OrderProductElementToJson(
        OrderProductElement instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      'certificate': instance.certificate,
      '_id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

OrderProductCertificateResponse _$OrderProductCertificateResponseFromJson(
        Map<String, dynamic> json) =>
    OrderProductCertificateResponse(
      originNumber: json['originNumber'] as String?,
      certificateURL: json['certificateURL'] as String?,
    );

Map<String, dynamic> _$OrderProductCertificateResponseToJson(
        OrderProductCertificateResponse instance) =>
    <String, dynamic>{
      'originNumber': instance.originNumber,
      'certificateURL': instance.certificateURL,
    };
