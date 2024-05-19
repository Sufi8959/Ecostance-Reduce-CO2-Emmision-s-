// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      city: json['city'],
      country: json['country'] as String?,
      line1: json['line1'],
      line2: json['line2'],
      postalCode: json['postal_code'],
      state: json['state'],
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
      'line1': instance.line1,
      'line2': instance.line2,
      'postal_code': instance.postalCode,
      'state': instance.state,
    };
