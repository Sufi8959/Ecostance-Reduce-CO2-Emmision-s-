import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/domain/forgot_password/modal/resp_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/login/bloc/login_bloc.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/profile/widgets/profile_list_items.dart';
import 'package:net_carbons/presentation/profile/widgets/slektons.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../../app/constants/string_constants.dart';
import 'child_screens/change_email/change_email.dart';

///TODO: Keep as stateless
class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<UserProfileBloc>(context)
    //     .add(const UserProfileEvent.started());
    return Scaffold(
      appBar: buildAppAppBar(() {
        Navigator.pop(context);
      }),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, authState) {
          return BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const ProfilePageSkeleton();
              } else if (state.userProfileModal != null) {
                return _buildProfile(
                    context, state.userProfileModal!, authState, state);
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          filled: true,
                          text: Text(ButtonStrings.login,
                              style: Theme.of(context).textTheme.headline2),
                          onTap: () async {
                            print("login button");
                            BlocProvider.of<LoginBloc>(context)
                                .add(const SetToInitial());
                            await Navigator.pushNamed(
                                    context, Routes.loginRoute)
                                .then((value) {
                              // BlocProvider.of<UserProfileBloc>(context)
                              //     .add(const UserProfileEvent.started());
                              // BlocProvider.of<UserProfileBloc>(context)
                              //     .add(const UserProfileEvent.fetchOrders());
                            });
                          },
                          feedbackTimeText: Text(ButtonStrings.login,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Login to see profile',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildProfile(BuildContext context, UserProfileModal userProfile,
      AuthState authState, UserProfileState state) {
    return ListView(
      children: [
        Container(
          height: 32.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            userProfile.billingAddress == null
                ? "Hi ${userProfile.user.email} "
                : "Hi ${userProfile.billingAddress?.firstName} ${userProfile.billingAddress?.lastName}!",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        ProfileListItem(
          icon: SvgPicture.asset(SvgAssets.earth),
          iconFeedback: SvgPicture.asset(
            SvgAssets.earth,
            color: AppColors.appWhite,
          ),
          text: "My dashboard",
          onTap: () {
            Navigator.pushNamed(context, Routes.screenDashboardCharts);
          },
        ),
        ProfileListItem(
          iconFeedback: SvgPicture.asset(
            SvgAssets.cartIcon,
            color: AppColors.appWhite,
          ),
          icon: SvgPicture.asset(SvgAssets.cartIcon),
          text: "My Orders",
          onTap: () {
            Navigator.pushNamed(context, Routes.myOrders);
          },
        ),
        ProfileListItem(
          iconFeedback: SvgPicture.asset(
            SvgAssets.personIconActive,
            color: AppColors.appWhite,
          ),
          icon: SvgPicture.asset(SvgAssets.personIconActive),
          text: "My Profile",
          onTap: () {
            Navigator.pushNamed(context, Routes.myProfile);
          },
        ),
        ProfileListItem(
            iconFeedback: const Icon(
              Icons.email,
              color: AppColors.appWhite,
            ),
            icon: const Icon(Icons.email),
            text: "Change Email",
            onTap: () {
              if (state.userProfileModal == null) {
                return;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ScreenChangeEmail(
                            currentEmail: state.userProfileModal!.user.email,
                            currentRecoveryEmail:
                                state.userProfileModal!.user.recoveryEmail,
                          )));
              // Navigator.pushNamed(context, Routes.settingsChangeEmail,
              //     arguments: OtpSubmitResponseModalSuccess(
              //         token: authState is Authenticated
              //             ? authState.authDataModal.token
              //             : ''));
            }),
        ProfileListItem(
            iconFeedback: const Icon(
              Icons.key,
              color: AppColors.appWhite,
            ),
            icon: const Icon(Icons.key),
            text: "Change Password",
            onTap: () {
              Navigator.pushNamed(context, Routes.settingsChangePassword,
                  arguments: OtpSubmitResponseModalSuccess(
                      token: authState is Authenticated
                          ? authState.authDataModal.token
                          : ''));
            }),
        ProfileListItem(
            iconFeedback: const Icon(
              Icons.location_city,
              color: AppColors.appWhite,
            ),
            icon: const Icon(Icons.location_city),
            text: "Change Address",
            onTap: () async {
              Navigator.pushNamed(
                context,
                Routes.settingsChangeAddress,
              );
            }),
        ProfileListItem(
          iconFeedback: const Icon(
            Icons.settings,
            color: AppColors.appWhite,
          ),
          icon: const Icon(Icons.settings),
          text: "Settings",
          onTap: () {
            Navigator.pushNamed(context, Routes.screenSettings);
          },
        ),
        ProfileListItem(
          iconFeedback: const Icon(
            Icons.pages,
            color: AppColors.appWhite,
          ),
          icon: const Icon(Icons.pages),
          text: "My EcoStance Page",
          onTap: () {
            Navigator.pushNamed(context, Routes.screenEcostancePage);
          },
        ),
        ProfileListItem(
          iconFeedback: const Icon(
            Icons.trending_up,
            color: AppColors.appWhite,
          ),
          icon: const Icon(Icons.trending_up),
          text: "My Affiliate Info",
          onTap: () {
            Navigator.pushNamed(context, Routes.screenAffiliateInfoPage);
          },
        ),
        ProfileListItem(
          iconFeedback: const Icon(
            Icons.share,
            color: AppColors.appWhite,
          ),
          icon: const Icon(Icons.share),
          text: "Share",
          onTap: () {
            Navigator.pushNamed(context, Routes.screenShare);
          },
        ),
        ProfileListItem(
          iconFeedback: const Icon(
            Icons.help_outline,
            color: AppColors.appWhite,
          ),
          icon: const Icon(Icons.help_outline),
          text: "Help",
          onTap: () {
            Navigator.pushNamed(context, Routes.screenHelp);
          },
        ),
        ProfileListItem(
          iconFeedback: SvgPicture.asset(
            SvgAssets.logout,
            color: AppColors.appWhite,
          ),
          icon: SvgPicture.asset(SvgAssets.logout),
          text: "Log out",
          onTap: () {
            BlocProvider.of<AuthBloc>(context)
                .add(const AuthEventLogoutRequested());
            BlocProvider.of<LoginBloc>(context).add(const LogoutRequested());
            BlocProvider.of<UserProfileBloc>(context)
                .add(const UserProfileEvent.reset());
            BlocProvider.of<CheckoutBloc>(context)
                .add(const CheckoutEvent.onLogout());
            BlocProvider.of<AppControllerBloc>(context).add(
                AppControllerEvent.updateCurrency(
                    currency: BlocProvider.of<AppControllerBloc>(context)
                            .state
                            .countryModal
                            ?.currencyCode ??
                        'USD'));
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

//
// return FutureBuilder(
// future: userProfileRepository.getUserProfile(),
// builder: (BuildContext context,
//     AsyncSnapshot<Either<Failiure, UserProfileModal>> snapshot) {
// if (snapshot.hasData) {
// return snapshot.data!.fold((l) {
// return Padding(
// padding:
// EdgeInsets.symmetric(horizontal: Sv.byWidthSize_28),
// child: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// AppOutlinedButton(
// filled: true,
// text: Text(ButtonStrings.login,
// style: Theme.of(context)
//     .textTheme
//     .button
//     ?.copyWith(color: AppColors.appWhite)),
// onTap: () {
// BlocProvider.of<LoginBloc>(context)
//     .add(SetToInitial());
// Navigator.pushNamed(context, Routes.loginRoute);
// },
// ),
// const Text(
// 'Login to see profile',
// ),
// ],
// ),
// ),
// );
// }, (r) {
// return _buildProfile(context, r);
// });
// } else {
// return const Center(
// child: CupertinoActivityIndicator(),
// );
// }
// },
// );
