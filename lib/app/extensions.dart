import 'package:intl_phone_field/phone_number.dart';
import 'package:intl_phone_field/countries.dart' as intlcountries;

const EMPTY = "";
const ZERO = 0;

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

extension BetweenInt on int {
  bool betweenInt(int a, int b) {
    if (this <= b && this >= a) {
      return true;
    } else {
      return false;
    }
  }
}

extension NonNulldouble on double? {
  double orZero() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}

extension FormatedDate on DateTime {
  String toFormatted() {
    return "$year $month ${day}";
  }
}

extension NullDate on DateTime {
  DateTime orNoDate() {
    return DateTime.fromMillisecondsSinceEpoch(1);
  }
}

extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension PhoneNumberValidate on PhoneNumber {
  String? isValid({required String message}) {
    final currentCountry = intlcountries.countries
        .firstWhere((element) => element.code == countryISOCode);

    if (completeNumber.isEmpty) {
      return null;
    }
    if (completeNumber.length < currentCountry.minLength ||
        completeNumber.length > currentCountry.maxLength) {
      return message;
    }
    return null;
  }
}
extension StringCapitalize on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension LongStringCapitalize on String {
  String capitalizeWords() {
    final List words = split(' ');
   final converted = words.map((e) => "${e[0].toUpperCase()}${e.substring(1).toLowerCase()}");

   return converted.join(' ');

  }
}