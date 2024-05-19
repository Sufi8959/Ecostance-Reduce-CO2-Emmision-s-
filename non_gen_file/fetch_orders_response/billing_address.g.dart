// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillingAddress _$BillingAddressFromJson(Map<String, dynamic> json) =>
    BillingAddress(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      contactNo: json['contactNo'] as String?,
      addressLine1: json['addressLine1'] as String?,
      addressLine2: json['addressLine2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      pincode: json['pincode'] as String?,
      stateCode: json['stateCode'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$BillingAddressToJson(BillingAddress instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'contactNo': instance.contactNo,
      'addressLine1': instance.addressLine1,
      'addressLine2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
      'stateCode': instance.stateCode,
      'countryCode': instance.countryCode,
    };
