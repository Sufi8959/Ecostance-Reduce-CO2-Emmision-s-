import 'package:flutter/material.dart';
import 'package:net_carbons/presentation/affiliate_chart/affiliate_charts.dart';
import 'package:net_carbons/presentation/cart/cart_drawer.dart';
import 'package:net_carbons/presentation/checkout/checkout_screen.dart';
import 'package:net_carbons/presentation/checkout/checkout_views/payment_page_view.dart';
import 'package:net_carbons/presentation/forgot_password/ScreenChangePassword.dart';
import 'package:net_carbons/presentation/forgot_password/screen_enter_otp.dart';
import 'package:net_carbons/presentation/forgot_password/screen_forgot_password.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/login/screen_login.dart';
import 'package:net_carbons/presentation/onBoarding/screen-start_screen.dart';
import 'package:net_carbons/presentation/onBoarding/screen_choose_country.dart';
import 'package:net_carbons/presentation/onBoarding/screen_onBoarding.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/onBoarding/screen_video.dart';
import 'package:net_carbons/presentation/onboarding/choose_action_screen.dart';
import 'package:net_carbons/presentation/profile/child_screens/change_adress/screen_change_address.dart';
import 'package:net_carbons/presentation/profile/child_screens/change_email/change_email.dart';
import 'package:net_carbons/presentation/profile/child_screens/change_password/screen_change_password.dart';
import 'package:net_carbons/presentation/profile/child_screens/dashboard/dashboard_charts.dart';
import 'package:net_carbons/presentation/profile/child_screens/delete_account/screen_delete_account.dart';
import 'package:net_carbons/presentation/profile/child_screens/ecostance_page/screen_ecostance_page_old.dart';
import 'package:net_carbons/presentation/profile/child_screens/help/screen_help.dart';
import 'package:net_carbons/presentation/profile/child_screens/my_profile/screen_my_profile.dart';
import 'package:net_carbons/presentation/profile/child_screens/order/screen_my_orders.dart';
import 'package:net_carbons/presentation/profile/child_screens/screen_dashboard.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/profile/child_screens/ecostance_page/screen_myecostancepage.dart';
import 'package:net_carbons/presentation/profile/child_screens/share/screen_share.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/register/screen_register.dart';
import 'package:net_carbons/presentation/single_product_page/product_details_bloc_page.dart';
import 'package:net_carbons/presentation/splash_screen/splash_screen.dart';

import '../checkout/screen_thanks_for_order.dart';
import '../checkout/screen_you_are_not_signedin.dart';
import '../profile/child_screens/delete_account/screen_delete_account_two.dart';
import '../profile/child_screens/ecostance_page/screen_ecostance_page.dart';
import '../profile/child_screens/screen_agreement.dart';

class Routes {
  static const String rootRoute = '/';
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails';
  static const String enterOtpScreen = '/enterOtpScreen';
  static const String cartScreen = '/cartScreen';
  static const String productDetailsScreen = '/productDetails';
  static const String newProductDetailsScreen = '/newProductDetailsScreen';
  static const String checkoutScreen = '/checkoutScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String chooseCountry = '/chooseCountry';
  static const String videoScreen = '/videoScreen';
  static const String quoteScreen = '/quoteScreen';
  static const String startScreen = '/startScreen';
  static const String chooseActionScreen = '/chooseActionScreen';
  static const String registrationThanks = '/registrationThanks';
  static const String screenRegistrationEnterOtp =
      '/screenRegistrationEnterOtp';
  static const String screenYouAreNotSignedIn = "/screenYouAreNotSignedIn";

  static const String screenSettings = "/screenSettings";
  static const String screenEcostancePage = "/screenEcostancePage";
  static const String screenAffiliateInfoPage = "/screenAffiliateInfoPage";
  static const String screenShare = "/screenShare";
  static const String userAgreement = "/userAgreement";
  static const String myOrders = "/myOrders";

  static const String orderThanks = "/orderThanks";

  static const String screenDashboard = '/screenDashboard';
  static const String settingsChangePassword = '/settingsChangePassword';
  static const String settingsChangeAddress = '/settingsChangeAddress';
  static const String settingsChangeEmail = '/settingsChangeEmail';

  static const String myProfile = '/myProfile';

  static const String screenHelp = '/screenHelp';
  static const String screenDeleteAccount = '/screenDeleteAccount';
  static const String screenDashboardCharts = '/screenDashboardCharts';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.rootRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(
            builder: (_) => ScreenLogin(), settings: settings);

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case Routes.registerRoute:
        return MaterialPageRoute(
            builder: (_) => ScreenRegister(), settings: settings);

      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ScreenForgotPassword());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainScreen());

      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => CartDrawer());

      case Routes.chooseCountry:
        return MaterialPageRoute(
            builder: (_) => const ScreenChooseCountry(), settings: settings);

      // case Routes.newProductDetailsScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => const NewScreenSingleProduct(), settings: settings);

      case Routes.newProductDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const SingleProductBlocView(), settings: settings);

      case Routes.checkoutScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenCheckout(), settings: settings);

      case Routes.enterOtpScreen:
        return MaterialPageRoute(
            builder: (_) => ScreenEnterOtp(), settings: settings);

      case Routes.changePasswordScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenChangePassword(), settings: settings);
      // case Routes.settingsChangeEmail:
      //   return MaterialPageRoute(
      //       builder: (_) =>  ScreenChangeEmail(), settings: settings);

      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenOnBoarding(), settings: settings);

      case Routes.startScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenStartScreen(), settings: settings);

      case Routes.chooseActionScreen:
        return MaterialPageRoute(
            builder: (_) => ScreenChooseAction(), settings: settings);

      case Routes.screenYouAreNotSignedIn:
        return MaterialPageRoute(
            builder: (_) => ScreenYouAreNotSignedIn(), settings: settings);

      case Routes.screenRegistrationEnterOtp:
        return MaterialPageRoute(
            builder: (_) => ScreenRegistrationEnterOtp(), settings: settings);
      // case Routes.registrationThanks:
      //   return MaterialPageRoute(
      //       builder: (_) => const ScreenRegistrationThanks(),
      //       settings: settings);

      // case Routes.videoScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => ScreenVideo(), settings: settings);

      case Routes.quoteScreen:
        return MaterialPageRoute(
            builder: (_) => const ScreenQuote(), settings: settings);

      case Routes.screenSettings:
        return MaterialPageRoute(
            builder: (_) => ScreenSettings(), settings: settings);

      case Routes.screenShare:
        return MaterialPageRoute(
            builder: (_) => ScreenShare(), settings: settings);

      case Routes.screenEcostancePage:
        return MaterialPageRoute(
            builder: (_) => ScreenEcostancePage(), settings: settings);

      case Routes.screenAffiliateInfoPage:
        return MaterialPageRoute(
            builder: (_) => const AffiliateCharts(), settings: settings);

      case Routes.userAgreement:
        return MaterialPageRoute(
            builder: (_) => ScreenAgreement(), settings: settings);

      case Routes.screenDashboard:
        return MaterialPageRoute(
            builder: (_) => const ScreenDashboard(), settings: settings);

      case Routes.settingsChangePassword:
        return MaterialPageRoute(
            builder: (_) => const ScreenSettingsChangePassword(),
            settings: settings);

      case Routes.settingsChangeAddress:
        return MaterialPageRoute(
            builder: (_) => ScreenChangeAddress(), settings: settings);

      case Routes.myOrders:
        return MaterialPageRoute(
            builder: (_) => ScreenMyOrders(), settings: settings);

      case Routes.myProfile:
        return MaterialPageRoute(
            builder: (_) => const ScreenMyProfile(), settings: settings);

      case Routes.orderThanks:
        return MaterialPageRoute(
            builder: (_) => ScreenThanksForOrder(), settings: settings);
      case Routes.paymentScreen:
        return MaterialPageRoute(
            builder: (_) => const ConfirmPaymentView(
                  firstOrderGiftCoupon: false,
                ),
            settings: settings);

      case Routes.screenHelp:
        return MaterialPageRoute(
            builder: (_) => ScreenHelp(), settings: settings);

      case Routes.screenDeleteAccount:
        return MaterialPageRoute(
            builder: (_) => ScreenDeleteAccount(), settings: settings);

      case Routes.screenDashboardCharts:
        return MaterialPageRoute(
            builder: (_) => const DashboardCharts(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: const Text('No Route Found'),
                  ),
                  body: const Center(
                    child: Text('No Route Found'),
                  ),
                ));
    }
  }
}
