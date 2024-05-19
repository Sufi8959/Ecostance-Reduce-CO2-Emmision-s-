// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) =>
    CountryResponse(
      id: json['id'] as String?,
      entity: json['entity'] as String?,
      countryCode: json['countryCode'] as String?,
      currencyName: json['currencyName'] as String?,
      currencyCode: json['currencyCode'] as String?,
      numericCode: json['numericCode'] as String?,
      minorUnit: json['minorUnit'] as String?,
      carbonCountryCode: json['carbonCountryCode'] as String?,
      carbonCountryPerCapita: json['carbonCountryPerCapita'] as String?,
      phonePrefix: json['phonePrefix'] as String?,
      status: json['status'] as String?,
      show: json['show'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.tryParse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.tryParse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      isCurrencySupported: json['isCurrencySupported'] as bool?,
    );

Map<String, dynamic> _$CountryResponseToJson(CountryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity': instance.entity,
      'countryCode': instance.countryCode,
      'currencyName': instance.currencyName,
      'currencyCode': instance.currencyCode,
      'numericCode': instance.numericCode,
      'minorUnit': instance.minorUnit,
      'carbonCountryCode': instance.carbonCountryCode,
      'carbonCountryPerCapita': instance.carbonCountryPerCapita,
      'phonePrefix': instance.phonePrefix,
      'status': instance.status,
      'show': instance.show,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'isCurrencySupported': instance.isCurrencySupported,
    };
