import 'package:json_annotation/json_annotation.dart';

import 'city.dart';

part 'city_response.g.dart';

@JsonSerializable()
class CityResponse {
  int? total;
  @JsonKey(name: 'data')
  List<City>? cities;

  CityResponse({this.total, this.cities});

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return _$CityResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}
