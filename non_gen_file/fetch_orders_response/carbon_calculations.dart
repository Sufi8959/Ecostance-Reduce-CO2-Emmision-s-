import 'package:json_annotation/json_annotation.dart';

part 'carbon_calculations.g.dart';

@JsonSerializable()
class CarbonCalculations {
  int? houseHoldMembers;
  int? publicTransportationMembers;
  String? income;
  String? houseSize;
  String? airTravel;
  String? meatConsumption;
  double? totalCarbonEmissions;
  String? countryCode;

  CarbonCalculations({
    this.houseHoldMembers,
    this.publicTransportationMembers,
    this.income,
    this.houseSize,
    this.airTravel,
    this.meatConsumption,
    this.totalCarbonEmissions,
    this.countryCode,
  });

  factory CarbonCalculations.fromJson(Map<String, dynamic> json) {
    return _$CarbonCalculationsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CarbonCalculationsToJson(this);
}
