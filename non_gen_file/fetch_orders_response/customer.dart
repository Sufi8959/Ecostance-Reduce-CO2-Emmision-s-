import 'package:json_annotation/json_annotation.dart';

import 'carbon_calculations.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  @JsonKey(name: '_id')
  String? id;
  String? user;
  List<dynamic>? address;
  int? ghgReduced;
  int? treesPlanted;
  List<String>? projectsSupported;
  int? projectsSupportedCount;
  int? totalCarbonEmissions;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(name: '__v')
  int? v;
  CarbonCalculations? carbonCalculations;
  String? companyName;

  Customer({
    this.id,
    this.user,
    this.address,
    this.ghgReduced,
    this.treesPlanted,
    this.projectsSupported,
    this.projectsSupportedCount,
    this.totalCarbonEmissions,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.carbonCalculations,
    this.companyName,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return _$CustomerFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
