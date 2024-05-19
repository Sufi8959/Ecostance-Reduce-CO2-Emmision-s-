import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class CountryResponse {
  String? id;
  String? entity;
  String? countryCode;
  String? currencyName;
  String? currencyCode;
  String? numericCode;
  String? minorUnit;
  String? carbonCountryCode;
  String? carbonCountryPerCapita;
  String? phonePrefix;
  String? status;
  String? show;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  bool? isCurrencySupported;

  CountryResponse({
    this.id,
    this.entity,
    this.countryCode,
    this.currencyName,
    this.currencyCode,
    this.numericCode,
    this.minorUnit,
    this.carbonCountryCode,
    this.carbonCountryPerCapita,
    this.phonePrefix,
    this.status,
    this.show,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isCurrencySupported
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    return _$CountryResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}
