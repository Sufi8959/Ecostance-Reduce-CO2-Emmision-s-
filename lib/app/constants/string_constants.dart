import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  static const String TOKEN = "TOKEN";
  static const String EMAIL = "EMAIL";
  static const String UID = "UID";
  static const String ID = "ID";
  static const String cartDb = 'cart_db';
  static const String userCountry = 'user_country';
  static const String countriesDb = 'countries_db';
  static const String calculateResultDb = 'calculate_db';

  static const String sharedPrefCurrencyKey = 'saved_currency';

  static const String sharedPrefNotificationStatusKey = 'saved_currency';

  static const String couponDb = 'coupon_db';
  static const String emailVerificationStatus = 'emailVerificationStatus';
  static  String webBase = dotenv.env['WEB_BASE_URL'] ?? '';
}

class AppConstants {
  // static const stripeSecret =
  //     "";
  // static const String stripePublic = dotenv...env['VAR_NAME'];

  static  String BASE_URL = dotenv.env['API_URL'] ?? '';
  static const String BASE_URL_LOCAL = "http://192.168.0.35:3001";
  static const String WISH_LIST_PREF_KEY = "wishList";

  static  RegExp emailRegExp =  RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
}

class ButtonStrings {
  static const String addToCart = "ADD TO CART";
  static const String buyNow = "BUY NOW";
  static const String verify = "VERIFY";
  static const String signUp = "SIGN UP";
  static const String login = "LOG IN";
  static const String continueText = "CONTINUE";
  static const String next = "NEXT";
  static const String start = "START";
  static const String getOTP = "GET OTP";
  static const String changePassword = "CHANGE PASSWORD";
  static const String pay = "Pay";
  static const String returnToCart = "RETURN TO CART";
  static const String close = "CLOSE";
  static const String checkout = "CHECKOUT";
  static const String checkoutNow = "CHECKOUT NOW";

  static const String okAddMore = "OK I'LL ADD MORE";
  static const String chooseProducts = "SHOW OTHER PRODUCTS";
  static const String iSignupLater = "I'LL SIGN UP LATER";

  static const String back = "Back";
}
