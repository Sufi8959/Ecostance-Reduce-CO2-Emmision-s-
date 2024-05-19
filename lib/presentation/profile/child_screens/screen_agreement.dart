import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

class ScreenAgreement extends StatelessWidget {
  ScreenAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Agreement",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: .5,
                        fontSize: 16,
                        color: AppColors.primaryActiveColor),
                  ),
                ),
              )),
          backgroundColor: AppColors.primaryInactive,
          hideWave: true),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: RichText(
                  text: TextSpan(
                      text: agrement,
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String agrement =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}
