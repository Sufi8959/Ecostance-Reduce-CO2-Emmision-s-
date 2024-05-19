// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderRequestAddress _$CreateOrderRequestAddressFromJson(
        Map<String, dynamic> json) =>
    CreateOrderRequestAddress(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] == null
          ? null
          : PhoneResponse.fromJson(json['phone'] as Map<String, dynamic>),
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      pincode: json['pincode'] as String?,
      stateCode: json['stateCode'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$CreateOrderRequestAddressToJson(
        CreateOrderRequestAddress instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
      'stateCode': instance.stateCode,
      'countryCode': instance.countryCode,
    };
