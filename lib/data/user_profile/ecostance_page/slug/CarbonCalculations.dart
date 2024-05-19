class CarbonCalculations {
  CarbonCalculations({
      this.houseHoldMembers, 
      this.publicTransportationMembers, 
      this.income, 
      this.houseSize, 
      this.airTravel, 
      this.meatConsumption, 
      this.totalCarbonEmissions, 
      this.countryCode,});

  CarbonCalculations.fromJson(dynamic json) {
    houseHoldMembers = json['houseHoldMembers'];
    publicTransportationMembers = json['publicTransportationMembers'];
    income = json['income'];
    houseSize = json['houseSize'];
    airTravel = json['airTravel'];
    meatConsumption = json['meatConsumption'];
    totalCarbonEmissions = json['totalCarbonEmissions'];
    countryCode = json['countryCode'];
  }
  int? houseHoldMembers;
  int? publicTransportationMembers;
  String? income;
  String? houseSize;
  String? airTravel;
  String? meatConsumption;
  double? totalCarbonEmissions;
  String? countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['houseHoldMembers'] = houseHoldMembers;
    map['publicTransportationMembers'] = publicTransportationMembers;
    map['income'] = income;
    map['houseSize'] = houseSize;
    map['airTravel'] = airTravel;
    map['meatConsumption'] = meatConsumption;
    map['totalCarbonEmissions'] = totalCarbonEmissions;
    map['countryCode'] = countryCode;
    return map;
  }

}