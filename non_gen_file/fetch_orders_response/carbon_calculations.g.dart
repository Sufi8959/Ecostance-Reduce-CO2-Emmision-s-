// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carbon_calculations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarbonCalculations _$CarbonCalculationsFromJson(Map<String, dynamic> json) =>
    CarbonCalculations(
      houseHoldMembers: json['houseHoldMembers'] as int?,
      publicTransportationMembers: json['publicTransportationMembers'] as int?,
      income: json['income'] as String?,
      houseSize: json['houseSize'] as String?,
      airTravel: json['airTravel'] as String?,
      meatConsumption: json['meatConsumption'] as String?,
      totalCarbonEmissions: (json['totalCarbonEmissions'] as num?)?.toDouble(),
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$CarbonCalculationsToJson(CarbonCalculations instance) =>
    <String, dynamic>{
      'houseHoldMembers': instance.houseHoldMembers,
      'publicTransportationMembers': instance.publicTransportationMembers,
      'income': instance.income,
      'houseSize': instance.houseSize,
      'airTravel': instance.airTravel,
      'meatConsumption': instance.meatConsumption,
      'totalCarbonEmissions': instance.totalCarbonEmissions,
      'countryCode': instance.countryCode,
    };
