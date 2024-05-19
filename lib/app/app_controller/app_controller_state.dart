part of 'app_controller_bloc.dart';

@freezed
class AppControllerState with _$AppControllerState {
  const factory AppControllerState.initial({
    CountryModal? countryModal,
    required bool isLoading,
    required String currency,
    required List<CountryModal> countries,
    AppControllerEventsType? appControllerEventsType,
    required List<CurrencyAndSymbol> currencyList,
    required AppCustomSettings appCustomSettings,
    required bool buildApp,
    required bool showSnackBar,
    required AppLevelSnackBar appLevelSnackBar,
  }) = InitialAppControllerState;
}

List<CurrencyAndSymbol> currencyList = [
  CurrencyAndSymbol("USD", "\$"),
  CurrencyAndSymbol("CAD", "\$"),
  CurrencyAndSymbol("GBP", "£"),
  CurrencyAndSymbol("EUR", "€"),
  CurrencyAndSymbol("INR", "₹"),
  CurrencyAndSymbol("JPY", "¥"),
  CurrencyAndSymbol("CNY", "¥"),
];

class AppLevelSnackBar {
  final String message;
  final Duration duration;
  final bool showSnack;

  AppLevelSnackBar(
      {required this.message, required this.duration, required this.showSnack});

  factory AppLevelSnackBar.empty() => AppLevelSnackBar(
      message: '', duration: Duration(seconds: 0), showSnack: false);
}

class CurrencyAndSymbol {
  final String currencyCode;
  final String currencySymbol;

  CurrencyAndSymbol(this.currencyCode, this.currencySymbol);
}
