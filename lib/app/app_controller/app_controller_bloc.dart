import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:net_carbons/app/app_controller/state_classes/settings.dart';
//import 'package:net_carbons/app/network_info/network_info.dart';
import 'package:net_carbons/data/core/mapper/mapper.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/notification/notification_helpers.dart';
import 'package:net_carbons/notification/scheduled_notification.dart';

import '../../data/all_countries/hive_modal/country_hive_modal.dart';
import '../../data/all_countries/repository/repository.dart';
import '../../domain/countries/model/country_modal.dart';

part 'app_controller_bloc.freezed.dart';
part 'app_controller_event.dart';
part 'app_controller_state.dart';

class AppControllerBloc extends Bloc<AppControllerEvent, AppControllerState> {
  final CountriesRepository countriesRepository;
  final UserProfileRepository userProfileRepository;
  ConnectivityResult previousConnection = ConnectivityResult.none;

  AppControllerBloc({
    required this.countriesRepository,
    required this.userProfileRepository,
  }) : super(InitialAppControllerState(
            isLoading: false,
            countries: [],
            currencyList: currencyList,
            currency: '',
            appCustomSettings: AppCustomSettings(notificationEnabled: false),
            buildApp: true,
            showSnackBar: false,
            appLevelSnackBar: AppLevelSnackBar.empty())) {
    /////
    // on<AppControllerEventSetBuildApp>(
    //     (event, emit) => emit(state.copyWith(buildApp: event.newStatus)));
    // ////
    // on<AppControllerEventsetAppSnackBar>((event, emit) => emit(
    //     state.copyWith(showSnackBar: true, appLevelSnackBar: event.snackBar)));
    // on<AppControllerEventremoveAppSnackBar>((event, emit) => emit(
    //     state.copyWith(
    //         showSnackBar: false, appLevelSnackBar: AppLevelSnackBar.empty())));
////
    on<AppControllerEventFetchCountries>((event, emit) async {
      emit(state.copyWith(
          isLoading: true,
          appControllerEventsType:
              AppControllerEventsType.appControllerEventFetchCountries));
      final localCountries =
          await countriesRepository.fetchAllCountriesFromLocal();
      if (localCountries.isNotEmpty) {
        print("Found local countries");
        return emit(state.copyWith(
            isLoading: false,
            countries: localCountries,
            appControllerEventsType:
                AppControllerEventsType.appControllerEventFetchCountries));
      } else {
        print("Not Found local countries");
        final res = await countriesRepository.fetAllCountries();
        res.fold((l) {
          emit(state.copyWith(isLoading: false));
        }, (countries) {
          countries.removeWhere((element) => element.countryCode.isEmpty);
          emit(state.copyWith(
              isLoading: false,
              countries: countries,
              appControllerEventsType:
                  AppControllerEventsType.appControllerEventFetchCountries));
          countriesRepository.saveAllCountriesToLocal(countries);
        });
      }
    });

    on<Started>((event, emit) async {
      CountryHiveModal? country;
      CountryModal? selectedCountryLocal;

      String currency = 'USD';

      bool notificationStatus = false;
      emit(state.copyWith(
          isLoading: true,
          appControllerEventsType:
              AppControllerEventsType.appControllerEventStarted));

      try {
        country = await countriesRepository.getCountryFromLocal();
        selectedCountryLocal = country?.hiveToCountryModal();
      } catch (e) {
        country = null;
        selectedCountryLocal = null;
      }
      try {
        final res = await countriesRepository.getCurrencyFromLocal();
        res != null ? currency = res : null;
        print("${res} MY CURRENCY");
      } catch (e) {
        currency = "USD";
      }
      try {
        await userProfileRepository.setNotificationEnabledStatusTrueIfNoKey();
        final resp = await userProfileRepository.getNotificationEnabledStatus();
        if (resp != null) {
          notificationStatus = resp;
        }
      } catch (e) {
        notificationStatus = false;
      }
      emit(state.copyWith(
          appCustomSettings: state.appCustomSettings
              .copyWith(notificationEnabled: notificationStatus),
          countryModal: selectedCountryLocal,
          currency: currency,
          appControllerEventsType:
              AppControllerEventsType.appControllerEventStarted));
    });

    on<UpdateCountry>((event, emit) async {
      print("UpdateCountry...................");
      return await countriesRepository
          .saveCountryToLocal(event.countryModal, true)
          .then((value) => emit(state.copyWith(
              countryModal: event.countryModal,
              appControllerEventsType:
                  AppControllerEventsType.appControllerEventUpdateCountry)));
    });

    on<AppControllerEventupdateCurrency>((event, emit) async {
      print("${AppControllerEventupdateCurrency} ${event.currency}");
      return await countriesRepository.saveCurrencyToLocal(event.currency).then(
          (value) => emit(state.copyWith(
              currency: event.currency,
              appControllerEventsType:
                  AppControllerEventsType.appControllerEventUpdateCurrency)));
    });
    on<AppControllerEventaddListOfCountries>((event, emit) {
      emit(state.copyWith(countries: event.data));
    });
    on<AppControllerEventSetNotificationStatus>((event, emit) async {
      if (event.newStatus) {
        ///TODO api
        scheduleNotificationAfter30Days();
      } else {
        flutterLocalNotificationsPlugin.cancelAll();
      }
      return await userProfileRepository
          .setNotificationEnabledStatus(event.newStatus)
          .then((value) => emit(state.copyWith(
              appCustomSettings: state.appCustomSettings
                  .copyWith(notificationEnabled: event.newStatus))));
    });
  }
}
