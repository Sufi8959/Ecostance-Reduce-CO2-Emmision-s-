import 'package:copy_with_extension/copy_with_extension.dart';

part 'country_modal.g.dart';

@CopyWith()
class CountryModal {
  CountryModal(
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
      required this.isCurrencySupported});

  String id;
  String entity;
  String countryCode;
  String currencyName;
  String currencyCode;
  String numericCode;
  String minorUnit;
  String carbonCountryCode;
  String carbonCountryPerCapita;
  String phonePrefix;
  String status;
  String show;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  bool isCurrencySupported;

  factory CountryModal.empty() => CountryModal(
        id: '',
        entity: '',
        countryCode: '',
        currencyName: '',
        currencyCode: '',
        numericCode: '',
        minorUnit: '',
        carbonCountryCode: '',
        carbonCountryPerCapita: '',
        phonePrefix: '',
        status: '',
        show: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        v: 0, isCurrencySupported: false,
      );
}
