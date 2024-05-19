import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:net_carbons/data/all_countries/hive_modal/country_hive_modal.dart';
import 'package:net_carbons/data/all_countries/repository/repository.dart';
import 'package:net_carbons/data/cart/hiveModal/cart_hive_modal.dart';
import 'package:net_carbons/data/checkout/repository.dart';
import 'package:net_carbons/data/core/network/app_api.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/forgot_password/repository/repository.dart';
import 'package:net_carbons/data/home_products/repository/repository.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/data/product/repository/repository.dart';
import 'package:net_carbons/data/register/repository/repository.dart';
import 'package:net_carbons/data/user_profile/calculator_result_hive/hive_modal.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/data/wish_list/repository/repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/cart/repository/cart_repository.dart';
import 'network_info/network_info.dart';

final getIt = GetIt.instance;

Future<void> setUpDep() async {
  Directory tempDir = await getTemporaryDirectory();
  var tempPath = tempDir.path;
  var cj = PersistCookieJar(
      ignoreExpires: true, storage: FileStorage('$tempPath/cookies'));

  final sharePref = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharePref);
  getIt.registerLazySingleton(
      () => LoginRepository(sharedPreferences: getIt<SharedPreferences>()));
  getIt.registerLazySingleton(() => RegisterRepository());
  getIt.registerLazySingleton(() => ForgotPasswordRepository());
  getIt.registerLazySingleton(() => UserProfileRepository(
      sharedPreferences: getIt<SharedPreferences>(),
      dio: getIt<DioManager>(),
      appApi: getIt<AppApi>()));

  getIt.registerLazySingleton(
      () => DioManager()..addInterceptor(CookieManager(cj)));
  getIt.registerLazySingleton(() => ProductsRepository());
  getIt.registerLazySingleton(() => CountriesRepository(
      sharedPreferences: getIt<SharedPreferences>(),
      appApi: getIt<AppApi>(),
      dio: getIt<DioManager>()));
  getIt.registerLazySingleton(() => SingleProductRepository());
  getIt.registerLazySingleton(() => CheckoutRepository());
  getIt.registerLazySingleton(() => NetworkInfoImplementer()..initialize());
  getIt.registerLazySingleton(() => CartRepository());
  getIt.registerLazySingleton(() => WishListRepo());
  getIt.registerLazySingleton(() => AppApi(dio: getIt<DioManager>()));
}

void registerHiveAdapters() {
  if (!Hive.isAdapterRegistered(HiveCartModalAdapter().typeId)) {
    Hive.registerAdapter(HiveCartModalAdapter());
  }
  if (!Hive.isAdapterRegistered(CountryHiveModalAdapter().typeId)) {
    Hive.registerAdapter(CountryHiveModalAdapter());
  }
  if (!Hive.isAdapterRegistered(SaveCalculationsHiveAdapter().typeId)) {
    Hive.registerAdapter(SaveCalculationsHiveAdapter());
  }
////
//   if (!Hive.isAdapterRegistered(ApplyCouponHiveModalAdapter().typeId)) {
//     Hive.registerAdapter(ApplyCouponHiveModalAdapter());
//   }
//
//   if (!Hive.isAdapterRegistered(StripeRegularCouponHiveModalAdapter().typeId)) {
//     Hive.registerAdapter(StripeRegularCouponHiveModalAdapter());
//   }
//
//   if (!Hive.isAdapterRegistered(
//       StripeSubscriptionCouponHiveModalAdapter().typeId)) {
//     Hive.registerAdapter(StripeSubscriptionCouponHiveModalAdapter());
//   }
//
//   if (!Hive.isAdapterRegistered(MetadataHiveAdapter().typeId)) {
//     Hive.registerAdapter(MetadataHiveAdapter());
//   }
}
