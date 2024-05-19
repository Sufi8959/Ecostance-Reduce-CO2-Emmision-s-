import 'dart:convert';

List<CountryPickerModel> countriesListModalFromJson(String str) =>
    List<CountryPickerModel>.from(
        json.decode(str).map((x) => CountryPickerModel.fromJson(x)));

class CountryPickerModel {
  CountryPickerModel({
    required this.countryName,
    required this.countryShortCode,
    required this.regions,
  });

  final String countryName;
  final String countryShortCode;
  final List<Region> regions;

  factory CountryPickerModel.fromJson(Map<String, dynamic> json) =>
      CountryPickerModel(
        countryName: json["countryName"],
        countryShortCode: json["countryShortCode"],
        regions:
            List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
      );
}

class Region {
  Region({
    required this.name,
    required this.shortCode,
  });

  final String name;
  final String shortCode;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        name: json["name"],
        shortCode: json["shortCode"] ?? '',
      );
}
