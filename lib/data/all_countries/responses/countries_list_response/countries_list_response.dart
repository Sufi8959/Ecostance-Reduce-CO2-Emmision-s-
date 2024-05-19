import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'countries_list_response.g.dart';

@JsonSerializable()
class CountriesListResponse {
  int? total;
  @JsonKey(name: 'data')
  List<CountryResponse> countries;

  CountriesListResponse(this.total, this.countries);

  factory CountriesListResponse.fromJson(Map<String, dynamic> json) {
    return _$CountriesListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountriesListResponseToJson(this);
}
