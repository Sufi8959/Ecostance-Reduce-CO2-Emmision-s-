import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:net_carbons/data/all_countries/city_response/city_response.dart';
import 'package:net_carbons/data/all_countries/hive_modal/country_hive_modal.dart';
import 'package:net_carbons/data/all_countries/responses/countries_list_response/countries_list_response.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/core/network/app_api.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/domain/countries/i_repository.dart';
import 'package:net_carbons/domain/countries/model/country_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/constants/string_constants.dart';

class CountriesRepository implements ICountriesRepository {
  CountriesRepository({
    required this.sharedPreferences,
    required this.appApi,
    required this.dio,
  });
  final AppApi appApi;
  final DioManager dio;
  final SharedPreferences sharedPreferences;
  @override
  Future<Either<Failure, List<CountryModal>>> fetAllCountries() async {
    //  var oldTime = DateTime.now().millisecondsSinceEpoch;

    //  print("Old time = ${DateTime.now()}");

    // final res = await appApi.apiGet(endpoint: '/v1/countries',queryParameters: {
    //   "provideMinimumInfo":1
    // });
    // return res.fold((l) {
    //   print("time = ${DateTime.now().millisecondsSinceEpoch - oldTime} ms");
    //   return Left(l);
    // }, (r) {
    //   print("time = ${DateTime.now().millisecondsSinceEpoch - oldTime} ms");
    //   return Right(CountriesListResponse.fromJson(r.data).toDomain());
    // });

    try {
      final res = await dio
          .get('/v1/countries', queryParameters: {"provideMinimumInfo": 1});
      if (res.statusCode == 200) {
        return Right(CountriesListResponse.fromJson(res.data).toDomain());
      } else {
        return Left(ServerFailure(message: "Server Error"));
      }
    } on SocketException catch (e) {
      return Left(ClientFailure(message: 'Internet connection failed')
          .orGeneric("Internet connection failed"));
    } /*on DioException catch (e) {
      print("error:: ${e.message}");
      //FirebaseCrashlytics.instance.recordError(e, StackTrace.current);
      return Left(ClientFailure(message: e.message)
          .orGeneric("Something went wrong. Please try again later."));
    }*/ catch (e) {
      return Left(ServerFailure(message: 'Server error')
          .orGeneric("Something went wrong. Please try again later."));
    }
  }

  @override
  Future<void> saveCountryToLocal(
      CountryModal countryModal, bool fromServer) async {
    final hiveModal = CountryHiveModal(
        id: countryModal.id,
        entity: countryModal.entity,
        countryCode: countryModal.countryCode,
        currencyName: countryModal.currencyName,
        currencyCode: countryModal.currencyCode,
        numericCode: countryModal.numericCode,
        minorUnit: countryModal.minorUnit,
        carbonCountryCode: countryModal.carbonCountryCode,
        carbonCountryPerCapita: countryModal.carbonCountryPerCapita,
        phonePrefix: countryModal.phonePrefix,
        status: countryModal.status,
        show: countryModal.show,
        createdAt: countryModal.createdAt,
        updatedAt: countryModal.updatedAt,
        v: countryModal.v,
        fromServer: fromServer,
        isCurrencySupported: countryModal.isCurrencySupported);
    await saveUserCountry(hiveModal);
  }

  @override
  Future<CountryHiveModal?> getCountryFromLocal() async {
    final country = await getUserCountry();
    return country;
  }

  @override
  Future<Either<Failure, CityResponse>> fetchCities(
      String? countryCode, String? stateCode) async {
    final res = await appApi.apiGet(
        endpoint: '/v1/cities',
        queryParameters: {"countryCode": countryCode, "stateCode": stateCode});
    return res.fold((l) => Left(l), (r) {
      return Right(CityResponse.fromJson(r.data));
    });
  }

  @override
  Future<String?> getCurrencyFromLocal() async {
    return sharedPreferences.getString(AppStrings.sharedPrefCurrencyKey);
  }

  @override
  Future<bool> saveCurrencyToLocal(String currency) async {
    return sharedPreferences.setString(
        AppStrings.sharedPrefCurrencyKey, currency);
  }

  @override
  Future<List<CountryModal>> fetchAllCountriesFromLocal() async {
    final list = await getAllCountries();
    if (list == null) {
      return [];
    }
    if (list.isEmpty) {
      return [];
    }
    List<CountryModal> countries = [];
    for (var element in list) {
      countries.add(element.hiveToCountryModal());
    }
    return countries;
  }

  @override
  Future<void> saveAllCountriesToLocal(List<CountryModal> countries) async {
    List<CountryHiveModal> list = countries.map((countryModal) {
      return CountryHiveModal(
          id: countryModal.id,
          entity: countryModal.entity,
          countryCode: countryModal.countryCode,
          currencyName: countryModal.currencyName,
          currencyCode: countryModal.currencyCode,
          numericCode: countryModal.numericCode,
          minorUnit: countryModal.minorUnit,
          carbonCountryCode: countryModal.carbonCountryCode,
          carbonCountryPerCapita: countryModal.carbonCountryPerCapita,
          phonePrefix: countryModal.phonePrefix,
          status: countryModal.status,
          show: countryModal.show,
          createdAt: countryModal.createdAt,
          updatedAt: countryModal.updatedAt,
          v: countryModal.v,
          fromServer: true,
          isCurrencySupported: countryModal.isCurrencySupported);
    }).toList();
    await saveAllCountries(list);
  }
}

Future<void> saveUserCountry(CountryHiveModal countryHiveModal) async {
  final countryDb =
      await Hive.openBox<CountryHiveModal>(AppStrings.userCountry);
  await countryDb.clear();
  await countryDb.add(countryHiveModal);
  await countryDb.close();
}

Future<CountryHiveModal?> getUserCountry() async {
  final countryDb =
      await Hive.openBox<CountryHiveModal>(AppStrings.userCountry);
  if (countryDb.values.isEmpty) {
    return null;
  }
  return countryDb.values.first;
}

Future<void> saveAllCountries(List<CountryHiveModal> countries) async {
  final countryDb =
      await Hive.openBox<CountryHiveModal>(AppStrings.countriesDb);
  await countryDb.clear();
  await countryDb.addAll(countries);
  await countryDb.close();
}

Future<List<CountryHiveModal>?> getAllCountries() async {
  final countryDb =
      await Hive.openBox<CountryHiveModal>(AppStrings.countriesDb);

  return countryDb.values.toList();
}

//
// bool hasConnection = networkInfo.hasConnection;
// if (!hasConnection) {
// return Left(ClientFailiure(message: 'Internet is not available'));
// } else {
// try {
// final resp = await dio.get('/v1/countries');
//
// if (resp.statusCode == 200) {
// final data = resp.data;
//
// final countries = CountriesListResponse.fromJson(data);
//
// return Right(countries.toDomain());
// } else {
// return Left(ServerFailiure(message: "Server Error"));
// }
// } on SocketException catch (e) {
// return Left(ClientFailiure(message: 'Internet connection failed')
//     .orGeneric("Internet connection failed"));
// } on DioError catch (e) {
// return Left(ClientFailiure(message: e.type.name)
//     .orGeneric("Something went wrong. Please try again later."));
// } catch (e) {
// return Left(
// ClientFailiure(message: 'Server error in fetching countries')
//     .orGeneric("Something went wrong. Please try again later."));
// }
// }
