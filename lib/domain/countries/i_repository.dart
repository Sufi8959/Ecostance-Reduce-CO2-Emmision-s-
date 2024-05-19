import 'package:dartz/dartz.dart';
import 'package:net_carbons/data/all_countries/hive_modal/country_hive_modal.dart';

import '../../data/core/general/failiure.dart';
import 'model/country_modal.dart';

abstract class ICountriesRepository<T> {
  Future<Either<Failure, T>> fetAllCountries();
  Future<void> saveCountryToLocal(CountryModal countryModal, bool fromServer);

  Future<void> saveCurrencyToLocal(String currency);
  Future<String?> getCurrencyFromLocal();

  Future<CountryHiveModal?> getCountryFromLocal();
  Future<Either<Failure, T>> fetchCities(String countryCode, String stateCode);

  Future<List<CountryModal>> fetchAllCountriesFromLocal();
  Future<void> saveAllCountriesToLocal(List<CountryModal> countries);
}
