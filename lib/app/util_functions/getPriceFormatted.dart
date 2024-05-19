import 'package:intl/intl.dart';
import 'package:net_carbons/app/constants/currency_symbol.dart';

String getPriceFormattedWithoutcode(String currency, double price) {
  if (currency.isEmpty) {
    return '';
  }
  var numberFormat = NumberFormat.currency(
    // decimalDigits: 2,
    locale: currencyToLocale[currency],
    symbol: currencySymbols[currency],
    name: currency,
    // customPattern: '${currencySymbols[currency]}',
  );
  var string = numberFormat.format(price);
  List<String> arr = string.split(currencySymbols[currency] ?? "");
  final result= "${currencySymbols[currency]!.trim()}${currency == "EUR"? convertEuro(arr[1].trim()): arr[1].trim()}";
  return result;
}

String getPriceFormattedWithCODE(String currency, double price) {
  if (currency.isEmpty) {
    return '';
  }
  var numberFormat = NumberFormat.currency(
    // decimalDigits: 2,
    locale: currencyToLocale[currency],
    symbol: currencySymbols[currency],
    name: currency,
    // customPattern: '${currencySymbols[currency]}',
  );
  var string = numberFormat.format(price);
  List<String> arr = string.split(currencySymbols[currency] ?? "");

  if (currencySymbols[currency] != null) {
    if (currencySymbols[currency]!.isNotEmpty) {
      return "$currency ${currencySymbols[currency]!.trim()}${currency == "EUR"? convertEuro(arr[1].trim()): arr[1].trim()}";
    }
  }
  return 'Error in formatting price';
}

String convertEuro(String amt){

  final aaa = amt.replaceAll(RegExp(r'\s'), '.');
  return aaa;
}

String spaceFormatOrderNum(String certificateNumber) {
  var certNumber = "";
  List<String> chars = certificateNumber.split("");

  chars.asMap().forEach((index, element) {
    certNumber += element;
    if (index == 3 || index == 7) certNumber += " ";
  });
  return certNumber;
}

const Map<String, String> currencyToLocale = {
  'ARS': 'es-ar',
  'USD': 'en-us',
  'BRL': 'pt-br',
  'CAD': 'en-ca',
  'AUD': 'en-au',
  'INR': 'en-in',
  'GBP': 'en-GB',
  'JPY': 'ja-JP',
  'MXN': 'es-MX',
  'DKK': 'da-DK',
  'EUR': 'de_AT'
};
