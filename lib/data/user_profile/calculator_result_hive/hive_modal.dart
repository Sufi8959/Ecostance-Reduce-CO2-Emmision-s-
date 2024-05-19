import 'package:hive/hive.dart';
part 'hive_modal.g.dart';

@HiveType(typeId: 4)
class SaveCalculationsHive {
  @HiveField(0)
  int houseHoldMembers;
  @HiveField(1)
  int publicTransportationMembers;
  @HiveField(2)
  String income;
  @HiveField(3)
  String houseSize;
  @HiveField(4)
  String airTravel;
  @HiveField(5)
  String meatConsumption;
  @HiveField(6)
  double totalCarbonEmissions;
  @HiveField(7)
  String countryCode;

  SaveCalculationsHive({
    required this.houseHoldMembers,
    required this.publicTransportationMembers,
    required this.income,
    required this.houseSize,
    required this.airTravel,
    required this.meatConsumption,
    required this.totalCarbonEmissions,
    required this.countryCode,
  });
}
