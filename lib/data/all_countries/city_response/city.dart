import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  String? name;
  String? countryCode;
  String? stateCode;
  String? latitude;
  String? longitude;

  City({
    this.name,
    this.countryCode,
    this.stateCode,
    this.latitude,
    this.longitude,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
