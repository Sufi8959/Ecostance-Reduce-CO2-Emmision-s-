import 'dart:developer';
import 'dart:io';

import 'package:country_codes/country_codes.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/app/internet_bloc/internet_bloc.dart';
import 'package:net_carbons/app/internet_bloc/internet_event.dart';
import 'package:net_carbons/app/internet_bloc/internet_state.dart';
import 'package:net_carbons/app/network_info/network_info.dart';
import 'package:net_carbons/data/all_countries/repository/repository.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/data/home_products/repository/repository.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/data/product/repository/repository.dart';
import 'package:net_carbons/data/register/repository/repository.dart';
import 'package:net_carbons/data/wish_list/repository/repository.dart';
import 'package:net_carbons/firebase_options.dart';
import 'package:net_carbons/notification/scheduled_notification.dart';
import 'package:net_carbons/notification/set_up_notification.dart';
import 'package:net_carbons/notification/showNotificationFunction.dart';
import 'package:net_carbons/presentation/calculate_page/bloc/calculate_bloc.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';
import 'package:net_carbons/presentation/login/bloc/login_bloc.dart';
import 'package:net_carbons/presentation/profile/bloc/ecostange_page/me/ecostance_page_bloc.dart';
import 'package:net_carbons/presentation/profile/bloc/ecostange_page/previous/ecostance_previous_bloc.dart';
import 'package:net_carbons/presentation/profile/bloc/ecostange_page/settings/ecostance_settings_bloc.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/register/bloc/register_bloc_bloc.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/theme_manager.dart';
import 'package:net_carbons/presentation/search_page/bloc/search_bloc.dart';
import 'package:net_carbons/presentation/single_product_page/bloc/product_details_bloc.dart';
import 'package:net_carbons/presentation/splash_screen/bloc/splash_bloc.dart';
import 'package:net_carbons/presentation/splash_screen/splash_screen.dart';
import 'package:net_carbons/presentation/wish_list/bloc/wish_list_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tzl;
import 'package:uni_links/uni_links.dart';

import 'data/cart/repository/cart_repository.dart';
import 'data/user_profile/repository/repository.dart';

// comment
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  showFlutterNotification(message);
}

Future<void> initUniLinks() async {
  try {
    String? initialLink = await getInitialLink();
    print("initialLink:: $initialLink");
    handleDeepLink(initialLink);
  } on PlatformException catch (e) {
    print("failed:: $e");
  } on FormatException {
    print("formate exception");
  }

  // Listen for incoming deep links
  linkStream.listen((String? link) {
    handleDeepLink(link);
  });
}

void handleDeepLink(String? link) {
  if (link != null && link.isNotEmpty) {
    // Extract data from the deep link
    Uri uri = Uri.parse(link);
    String? data = uri.queryParameters['refId'];

    // Use the data as needed in your app
    print('Received data from deep link: $data');

    // Optionally, navigate to a specific screen or handle the data
    _handleDeepLinkData(data);
  }
}

// Save the deep link data to local storage

Future<void> _saveDeepLinkData(String? data) async {
  // Save the data to local storage
  // Example:
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (data != null) {
    await prefs.setString('deep_link_data', data);
    print('Deep link data saved to local storage: $data');
  } else {
    print('Deep link data not saved to local storage: $data');
  }
}

// Handle the deep link data

void _handleDeepLinkData(String? data) {
  // You can implement logic to navigate to a specific screen based on the deep link data
  // save the data to local storage
  _saveDeepLinkData(data);

  print('============> Handling deep link data: $data');

  // navigatorKey.currentState?.push(MaterialPageRoute(builder: (_) {
  //   // Example: Navigating to a screen with the received data
  //   return ScreenWithDeepLinkData(data: data);
  // }));
}

GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "NavigatorState");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'EcoStance',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Get the FCM token
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  print('FCM Token: $fcmToken');

  await FlutterConfig.loadEnvVariables();
  await setUpDep();
  tzl.initializeTimeZones();

  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  scheduleNotificationAfter30Days();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Initialize deep linking
  await initUniLinks();
  CountryCodes.init(const Locale.fromSubtags(languageCode: "en"));
  await Hive.initFlutter();
  registerHiveAdapters();
  await dotenv.load(fileName: ".env");
  await FlutterDownloader.initialize(
      debug: true,
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  FirebaseMessaging.instance.subscribeToTopic('weather');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((event) {
    print(event);
    print("Listening to firebase notifications");
    showFlutterNotification(event);
  });
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(const MyApp());
}

GlobalKey scaffoldKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _handleMessage(RemoteMessage message) {
    print('_handleMessage');
    navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (_) => const ScreenSettings()));
  }

  // Future<void> setupInteractedMessage() async {
  //   RemoteMessage? initialMessage =
  //       await FirebaseMessaging.instance.getInitialMessage();
  //   if (initialMessage != null) {
  //     _handleMessage(initialMessage);
  //   }
  //
  //   FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  // }

  @override
  Widget build(BuildContext context) {
    //setupInteractedMessage();

    getIt<NetworkInfoImplementer>().initialize();
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc()..add(InitEvent()),
        ),
        BlocProvider<AppControllerBloc>(
          create: (context) => AppControllerBloc(
              countriesRepository: getIt<CountriesRepository>(),
              userProfileRepository: getIt<UserProfileRepository>())
            ..add(const AppControllerEvent.started())
            ..add(const AppControllerEvent.fetchCountries()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
              internetBloc: BlocProvider.of<InternetBloc>(context),
              repository: getIt<LoginRepository>(),
              userProfileRepository: getIt<UserProfileRepository>(),
              appControllerBloc: BlocProvider.of<AppControllerBloc>(context),
              dio: getIt<DioManager>()),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(
            internetBloc: BlocProvider.of<InternetBloc>(context),
            repository: getIt<RegisterRepository>(),
            loginRepository: getIt<LoginRepository>(),
            appControllerBloc: BlocProvider.of<AppControllerBloc>(context),
            authBloc: BlocProvider.of<AuthBloc>(context),
            userProfileRepository: getIt<UserProfileRepository>(),
          ),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
              appControllerBloc: BlocProvider.of<AppControllerBloc>(context),
              repository: getIt<LoginRepository>(),
              authBloc: BlocProvider.of<AuthBloc>(context)),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(
              authBloc: BlocProvider.of<AuthBloc>(context),
              internetBloc: BlocProvider.of<InternetBloc>(context)),
        ),
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(
              productsRepository: getIt<ProductsRepository>(),
              appControllerBloc: BlocProvider.of<AppControllerBloc>(context)),
        ),
        BlocProvider<CartBloc>(
            create: (context) => CartBloc(
                cartRepository: getIt<CartRepository>(),
                authBloc: BlocProvider.of<AuthBloc>(context),
                productsBloc: BlocProvider.of<ProductsBloc>(context),
                appControllerBloc:
                    BlocProvider.of<AppControllerBloc>(context))),
        BlocProvider<WishListBloc>(
          create: (context) => WishListBloc(
              wishListRepo: getIt<WishListRepo>(),
              authBloc: BlocProvider.of<AuthBloc>(context),
              appControllerBloc: BlocProvider.of<AppControllerBloc>(context)),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(
            productsRepository: getIt<ProductsRepository>(),
            appControllerBloc: BlocProvider.of<AppControllerBloc>(context),
            productsBloc: BlocProvider.of<ProductsBloc>(context),
          ),
        ),
        BlocProvider<UserProfileBloc>(
          create: (context) => UserProfileBloc(
            authBloc: BlocProvider.of<AuthBloc>(context),
            appControllerBloc: BlocProvider.of<AppControllerBloc>(context),
            cartBloc: BlocProvider.of<CartBloc>(context),
          )..add(const UserProfileEvent.started()),
        ),
        BlocProvider<CalculateBloc>(
          create: (context) => CalculateBloc(
            appControllerBloc: BlocProvider.of<AppControllerBloc>(context),
            authBloc: BlocProvider.of<AuthBloc>(context),
            userProfileBloc: BlocProvider.of<UserProfileBloc>(context),
            productsBloc: BlocProvider.of<ProductsBloc>(context),
          )..add(const CalculateEvent.started()),
        ),
        BlocProvider<CheckoutBloc>(
          create: (context) => CheckoutBloc(
            authBloc: BlocProvider.of<AuthBloc>(context),
            internetBloc: BlocProvider.of<InternetBloc>(context),
            appControllerBloc: BlocProvider.of<AppControllerBloc>(context),
            userProfileBloc: BlocProvider.of<UserProfileBloc>(context),
            cartRepository: getIt<CartRepository>(),
            cartBloc: BlocProvider.of<CartBloc>(context),
          ),
        ),
        BlocProvider(
          create: (context) => ProductDetailsBloc(
              singleProductRepository: getIt<SingleProductRepository>(),
              appControllerBloc: BlocProvider.of<AppControllerBloc>(context)),
        ),
        BlocProvider(create: (context) => EcostancePageBloc()),
        // BlocProvider(create: (context) => EcostanceSettingsBloc()),
        // BlocProvider(create: (context) => EcostancePreviousBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (BuildContext context, Widget? child) {
          // return MaterialApp(
          //    navigatorKey: navigatorKey,
          //    key: scaffoldKey,
          //    title: 'NetCarbons',
          //    theme: getThemeData(),
          //    onGenerateRoute: (settings) =>
          //        RouteGenerator.generateRoute(settings),
          //    home: const SplashScreen(),
          //  );
          return BlocConsumer<InternetBloc, InternetState>(
            listenWhen: (previous, current) => previous != current,
            listener: (context, state) {
              if (state is DisconnectedState) {
                if (!state.isPopupOpen) {
                  showMyDialog(context);
                }
              }
            },
            buildWhen: (p, c) => p != c,
            builder: (context, state) {
              // log("BUILDING MaterialApp");

              SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                statusBarColor:
                    Colors.transparent, // Set status bar color to transparent
              ));

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                key: scaffoldKey,
                title: 'EcoStance',
                theme: getThemeData(),
                onGenerateRoute: (settings) =>
                    RouteGenerator.generateRoute(settings),
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }

  static const appCastUrl =
      "https://github.com/energy-blockchain-org/app_release/blob/main/appcast.xml";
}

showMyDialog(BuildContext context) {
  BlocProvider.of<InternetBloc>(context)
      .add(InternetBlocPopUpStatusChanged(newStatus: true));
  Platform.isIOS
      ? showDialog(
              context: navigatorKey.currentContext!,
              builder: (context) => BlocConsumer<InternetBloc, InternetState>(
                    listenWhen: (p, c) => true,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return CupertinoAlertDialog(
                        content: const Text(
                          'Network connection not found',
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                BlocProvider.of<InternetBloc>(context)
                                    .add(InternetBlocConnectionChanged());
                              },
                              child: const Text('Retry'))
                        ],
                      );
                    },
                  ),
              barrierDismissible: false)
          .then((value) => BlocProvider.of<InternetBloc>(context)
              .add(InternetBlocPopUpStatusChanged(newStatus: false)))
      : showDialog(
              context: navigatorKey.currentContext!,
              builder: (context) => BlocConsumer<InternetBloc, InternetState>(
                    listenWhen: (p, c) => true,
                    listener: (context, state) {},
                    builder: (context, state) {
                      return AlertDialog(
                        content: const Text(
                          'Network connection not found',
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                BlocProvider.of<InternetBloc>(context)
                                    .add(InternetBlocConnectionChanged());
                              },
                              child: const Text('Retry'))
                        ],
                      );
                    },
                  ),
              barrierDismissible: false)
          .then((value) => BlocProvider.of<InternetBloc>(context)
              .add(InternetBlocPopUpStatusChanged(newStatus: false)));
}

//[!] CocoaPods did not set the base configuration of your project
// because your project already has a custom config set. In order for CocoaPods
// integration to work at all, please either set the base configurations of the target
// `Runner` to `Target Support Files/Pods-Runner/Pods-Runner.profile.xcconfig` or include the
// `Target Support Files/Pods-Runner/Pods-Runner.profile.xcconfig`
// in your build configuration (`Flutter/Debug.xcconfig`).
