import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';

import '../../../../app/auth/auth_bloc.dart';

class ScreenMyEcostance extends StatelessWidget {
  const ScreenMyEcostance({Key? key}) : super(key: key);
  void _shareLink() {
    Share.share('https://ecostance.marketsverse.com/c/chiranjeeb',
        subject: 'My EcoStance Page');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, userProfileState) {
        return BlocBuilder<AppControllerBloc, AppControllerState>(
          builder: (context, appState) {
            return ModalProgressHUD(
              inAsyncCall: userProfileState.isLoading,
              progressIndicator: const CupertinoActivityIndicator(),
              child: Scaffold(
                appBar: buildAppAppBar(() {
                  Navigator.pop(context);
                },
                    bottom: PreferredSize(
                        preferredSize: Size.fromHeight(80.h),
                        child: Container(
                          color: AppColors.primaryInactive,
                          height: 41.h,
                          child: Center(
                            child: Text(
                              "My EcoStance Page",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5,
                                      fontSize: 16,
                                      color: AppColors.primaryActiveColor),
                            ),
                          ),
                        )),
                    backgroundColor: AppColors.primaryInactive,
                    hideWave: true),
                body: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SettingsItem(
                            title: 'My EcoStance Page',
                            value:
                                appState.appCustomSettings.notificationEnabled,
                            onChange: (newVal) {
                              BlocProvider.of<AppControllerBloc>(context).add(
                                AppControllerEvent.setNotificationStatus(
                                    newVal),
                              );
                            },
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Visibility(
                            visible:
                                appState.appCustomSettings.notificationEnabled,
                            child: Column(
                              children: [
                                QrImageView(
                                  data:
                                      "https://ecostance.marketsverse.com/c/chiranjeeb", // Replace with your actual link data
                                  version: QrVersions.auto,
                                  size: 120,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'https://ecostance.marketsverse.com/c/chiranjeeb', // Replace with your actual link
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Share your EcoStance Page with your friends and family to help them reduce their carbon footprint.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    height: 1.5,
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      _shareLink();
                                      // Action to perform when the button is pressed
                                      print('Button Pressed!');
                                    },
                                    icon: Icon(Icons.share),
                                    label: const Text('Share EcoStance Page'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      fixedSize: Size.fromHeight(50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // child: Column(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     SettingsItem(
                      //       title: 'My EcoStance Page',
                      //       value:
                      //           appState.appCustomSettings.notificationEnabled,
                      //       onChange: (newVal) {
                      //         BlocProvider.of<AppControllerBloc>(context).add(
                      //             AppControllerEvent.setNotificationStatus(
                      //                 newVal));
                      //       },
                      //     ),
                      //     SizedBox(
                      //       height: 12.h,
                      //     ),
                      //     // SettingsItem(
                      //     //   title: 'Newsletter',
                      //     //   value: userProfileState
                      //     //           .userProfileModal?.user.newsLetter ??
                      //     //       false,
                      //     //   onChange: (newVal) {
                      //     //     if (userProfileState.userProfileModal == null) {
                      //     //       return;
                      //     //     }
                      //     //     if (userProfileState.userProfileModal!.user
                      //     //             .emailVerificationStatus ==
                      //     //         "VERIFIED") {
                      //     //       _updateNewsLetter(
                      //     //           context, newVal, userProfileState);
                      //     //     } else if (userProfileState.userProfileModal!.user
                      //     //             .emailVerificationStatus ==
                      //     //         "UNVERIFIED") {
                      //     //       Navigator.pushNamed(context,
                      //     //               Routes.screenRegistrationEnterOtp,
                      //     //               arguments: OtpVerificationArguments(
                      //     //                   userProfileState
                      //     //                       .userProfileModal!.user.email,
                      //     //                   Routes.screenSettings))
                      //     //           .then((value) {
                      //     //         if (value == VerifyStatusEum.VERIFIED) {
                      //     //           _updateNewsLetter(
                      //     //               context, newVal, userProfileState);
                      //     //         } else {
                      //     //           ScaffoldMessenger.of(context).showSnackBar(
                      //     //               const SnackBar(
                      //     //                   content: Text(
                      //     //                       'Please verify your email to subscribe')));
                      //     //         }
                      //     //       });
                      //     //     }
                      //     //   },
                      //     // )
                      //     QrImageView(
                      //       data:
                      //           "https://ecostance.marketsverse.com/c/chiranjeeb", // Replace with your actual link data
                      //       version: QrVersions.auto,
                      //       size: 120,
                      //     ),
                      //     const SizedBox(height: 8),
                      //     Text(
                      //       'https://ecostance.marketsverse.com/c/chiranjeeb', // Replace with your actual link
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: AppColors.primaryActiveColor,
                      //       ),
                      //     ),
                      //     const SizedBox(height: 12),
                      //     const Text(
                      //       'Share your EcoStance Page with your friends and family to help them reduce their carbon footprint.',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         height: 1.5,
                      //         color: AppColors.primaryActiveColor,
                      //       ),
                      //     ),
                      //     const SizedBox(
                      //         height:
                      //             20), // Adding some space between text and button
                      //     SizedBox(
                      //       width: double.infinity,
                      //       child: ElevatedButton.icon(
                      //         onPressed: () {
                      //           _shareLink();
                      //           // Action to perform when the button is pressed
                      //           print('Button Pressed!');
                      //         },
                      //         icon: Icon(Icons.share),
                      //         label: const Text('Share EcoStance Page'),
                      //         style: ElevatedButton.styleFrom(
                      //           primary: Colors.black,
                      //           fixedSize: Size.fromHeight(50),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _updateNewsLetter(
      BuildContext context, bool newVal, UserProfileState userProfileState) {
    BlocProvider.of<UserProfileBloc>(context).add(
        UserProfileEvent.subscribeOrUnsubscribeToMailingList(
            mailingListSubscribeAction: newVal == true
                ? MailingListSubscribeAction.subscribe
                : MailingListSubscribeAction.unSubscribe,
            email: userProfileState.userProfileModal!.user.email));
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    Key? key,
    required this.title,
    required this.value,
    required this.onChange,
  }) : super(key: key);
  final String title;
  final bool value;
  final Function(bool) onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(color: AppColors.primaryActiveColor),
        )),
        // Platform.isIOS
        //     ?
        CupertinoSwitch(
          value: value,
          onChanged: onChange,
          activeColor: Colors.green,
          trackColor: AppColors.lightGrey,
        )
        //     : Switch(
        //         value: value,
        //         onChanged: onChange,
        //         activeColor: Colors.green,
        //         activeTrackColor: Colors.green,
        //         trackColor: MaterialStateProperty.resolveWith((states) => AppColors.lightGrey,),
        //         thumbColor: MaterialStateProperty.resolveWith((states) => AppColors.appWhite,),
        //         // trackColor:
        //         //     MaterialStateProperty.resolveWith((states) => AppColors.lightGrey,)
        // )
      ],
    );
  }
}

class SimpleAppBar extends StatelessWidget {
  const SimpleAppBar({
    Key? key,
    required this.title,
    this.onBack,
  }) : super(key: key);

  final String title;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  onBack != null ? onBack!() : () {};
                },
                icon: const Icon(Icons.arrow_back_ios)),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: .5,
                  fontSize: 16,
                  color: AppColors.primaryActiveColor),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.transparent,
                )),
          ],
        ),
      ),
    );
  }
}
