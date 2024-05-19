import 'package:json_annotation/json_annotation.dart';

part 'carbol_calculations_response.g.dart';

@JsonSerializable()
class CarbonCalculationsResponse {
  int? houseHoldMembers;
  int? publicTransportationMembers;
  String? income;
  String? houseSize;
  String? airTravel;
  String? meatConsumption;
  double? totalCarbonEmissions;
  String? countryCode;

  CarbonCalculationsResponse({
    this.houseHoldMembers,
    this.publicTransportationMembers,
    this.income,
    this.houseSize,
    this.airTravel,
    this.meatConsumption,
    this.totalCarbonEmissions,
    this.countryCode,
  });

  factory CarbonCalculationsResponse.fromJson(Map<String, dynamic> json) {
    return _$CarbonCalculationsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CarbonCalculationsResponseToJson(this);
}
