import 'package:hive_flutter/hive_flutter.dart';

part 'country_hive_modal.g.dart';

@HiveType(typeId: 2)
class CountryHiveModal {
  CountryHiveModal(
      {required this.id,
      required this.entity,
      required this.countryCode,
      required this.currencyName,
      required this.currencyCode,
      required this.numericCode,
      required this.minorUnit,
      required this.carbonCountryCode,
      required this.carbonCountryPerCapita,
      required this.phonePrefix,
      required this.status,
      required this.show,
      required this.createdAt,
      required this.updatedAt,
      required this.v,
      required this.fromServer,
      required this.isCurrencySupported});

  @HiveField(0)
  String id;
  @HiveField(1)
  String entity;
  @HiveField(2)
  String countryCode;
  @HiveField(3)
  String currencyName;
  @HiveField(4)
  String currencyCode;
  @HiveField(5)
  String numericCode;
  @HiveField(6)
  String minorUnit;
  @HiveField(7)
  String carbonCountryCode;
  @HiveField(8)
  String carbonCountryPerCapita;
  @HiveField(9)
  String phonePrefix;
  @HiveField(10)
  String status;
  @HiveField(11)
  String show;
  @HiveField(12)
  DateTime createdAt;
  @HiveField(13)
  DateTime updatedAt;
  @HiveField(14)
  int v;
  @HiveField(15)
  bool fromServer;
  @HiveField(16)
  bool isCurrencySupported;
}
