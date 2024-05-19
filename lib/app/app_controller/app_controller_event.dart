part of 'app_controller_bloc.dart';

@freezed
class AppControllerEvent with _$AppControllerEvent {
  const factory AppControllerEvent.started() = Started;

  const factory AppControllerEvent.updateCountry(
      {required CountryModal countryModal}) = UpdateCountry;

  const factory AppControllerEvent.updateCurrency({required String currency}) =
      AppControllerEventupdateCurrency;

  const factory AppControllerEvent.fetchCountries() =
      AppControllerEventFetchCountries;

  const factory AppControllerEvent.setNotificationStatus(bool newStatus) =
      AppControllerEventSetNotificationStatus;
  const factory AppControllerEvent.addListOfCountries(List<CountryModal> data) =
      AppControllerEventaddListOfCountries;

  // const factory AppControllerEvent.setBuildApp(bool newStatus) =
  // AppControllerEventSetBuildApp;
  //
  // const factory AppControllerEvent.setAppSnackBar(AppLevelSnackBar snackBar) =
  // AppControllerEventsetAppSnackBar;
  // const factory AppControllerEvent.removeAppSnackBar() =
  // AppControllerEventremoveAppSnackBar;
}

enum AppControllerEventsType {
  appControllerEventStarted,
  appControllerEventUpdateCountry,
  appControllerEventUpdateCurrency,
  appControllerEventFetchCountries
}
