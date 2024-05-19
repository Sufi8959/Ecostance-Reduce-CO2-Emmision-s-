// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesListResponse _$CountriesListResponseFromJson(
        Map<String, dynamic> json) =>
    CountriesListResponse(
      json['total'] as int?,
      (json['data'] as List<dynamic>)
          .map((e) => CountryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountriesListResponseToJson(
        CountriesListResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.countries,
    };
