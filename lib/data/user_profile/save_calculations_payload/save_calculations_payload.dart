import 'package:json_annotation/json_annotation.dart';

part 'save_calculations_payload.g.dart';

@JsonSerializable()
class SaveCalculationsPayload {
  int houseHoldMembers;
  int publicTransportationMembers;
  String income;
  String houseSize;
  String airTravel;
  String meatConsumption;
  double totalCarbonEmissions;
  String countryCode;

  SaveCalculationsPayload({
    required this.houseHoldMembers,
    required this.publicTransportationMembers,
    required this.income,
    required this.houseSize,
    required this.airTravel,
    required this.meatConsumption,
    required this.totalCarbonEmissions,
    required this.countryCode,
  });

  Map<String, dynamic> toJson() => _$SaveCalculationsPayloadToJson(this);
}
