import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/color.dart';

import '../../app/auth/auth_bloc.dart';
import '../app_widgets/outlined_button.dart';
import '../resources/assets.dart';
import '../resources/route_manager.dart';
import '../resources/texts.dart';

class ScreenStartScreen extends StatelessWidget {
  const ScreenStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                height: 422.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.startScreenImage),
                      fit: BoxFit.fitWidth),
                ),
              ),
              Positioned(
                bottom: -50.h,
                left: 0,
                child: Image.asset(
                  ImageAssets.onBoardingSvg,
                ),
              ),
              Positioned(
                top: 51.h,
                left: 0,
                right: 0,
                child: const LogoBar(),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.startScreenTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(height: 1.15),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  AppTexts.startScreenSubTitile,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(height: 1.2),
                ),
                SizedBox(
                  height: 35.h,
                ),
                AppButton(
                  height: 60.h,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.registerRoute)
                        .then((value) {
                      if (value == VerifyStatusEum.VERIFIED ||
                          value == VerifyStatusEum.AUTHENTICATED) {
                        Navigator.pushReplacementNamed(
                            context, Routes.chooseActionScreen);
                      }
                    });
                  },
                  text: Text(
                    ButtonStrings.signUp,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  filled: true,
                  feedbackTimeText: Text(
                    ButtonStrings.signUp,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.primaryActiveColor),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppButton(
                  outlineColor: AppColors.primaryActiveColor,
                  height: 60.h,
                  onTap: () async {
                    Navigator.pushNamed(context, Routes.loginRoute)
                        .then((value) {
                      if (value is Authenticated ||
                          value == VerifyStatusEum.VERIFIED ||
                          value == VerifyStatusEum.AUTHENTICATED) {
                        Navigator.pushReplacementNamed(
                            context, Routes.chooseActionScreen);
                      } else {
                        print("ELSWE");
                      }
                    });
                  },
                  text: Text(
                    ButtonStrings.login,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.primaryActiveColor),
                  ),
                  filled: false,
                  feedbackTimeText: Text(
                    ButtonStrings.login,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.appWhite),
                  ),
                ),
                SizedBox(
                  height: 29.h,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.chooseActionScreen);
                    },
                    child: Text(ButtonStrings.iSignupLater,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: AppColors.primaryActiveColor, height: 1.22)),
                  ),
                ),
                Container(
                  height: 88.h,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
