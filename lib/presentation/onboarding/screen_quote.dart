import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/resources/color.dart';

import '../resources/assets.dart';
import '../resources/route_manager.dart';

class ScreenQuote extends StatelessWidget {
  const ScreenQuote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 254.h,
                ),
                SvgPicture.asset(
                  SvgAssets.qt,
                  height: 35.h,
                  width: 51.w,
                ),
                SizedBox(
                  height: 27.h,
                ),
                Container(
                  height: 69.h,
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          'Together, we can solve the global warming crisis if we just reduce our own carbon footprint.',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontStyle: FontStyle.italic,
                          height: 1.4.h,
                          color: AppColors.primaryActiveColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 64.h,
                ),
                Container(
                  width: 225.w,
                  height: 26.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                    ImageAssets.homeBarLogo,
                  ))),
                ),
                SizedBox(
                  height: 239.h,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w),
              child: AppButton(
                height: 60.h,
                onTap: () {
                  Navigator.pushNamed(context, Routes.chooseCountry);
                },
                text: Text(
                  ButtonStrings.start,
                  style: Theme.of(context).textTheme.headline2,
                ),
                filled: true,
                feedbackTimeText: Text(
                  ButtonStrings.start,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: AppColors.primaryActiveColor),
                ),
              ),
            ),
            SizedBox(
              height: 68.h,
            )
          ],
        ),
      ),
    );
  }
}

class LogoBar extends StatelessWidget {
  const LogoBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 135.w,
          height: 32.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
            ImageAssets.homeBarLogo,
          ))),
        ),
      ],
    );
  }
}
