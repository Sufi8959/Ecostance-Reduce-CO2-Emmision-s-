import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/shimmer_container.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../bloc/user_profile_bloc.dart';

class ScreenDashboard extends StatelessWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.getMetrics());
    return Scaffold(
      backgroundColor: AppColors.primaryInactive,
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
                    "My Dashboard",
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
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state.isLoading) {
            return DashSkeleton();
          } else if (state.hasError) {
            return const Center(
              child: Text("Error in getting data"),
            );
          }
          return SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18.h,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 157.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightGrey, width: 1),
                            color: AppColors.appWhite,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.dashboardMetricsModal.ghgReduced} Metric Tons",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  "Carbon Offsets Bought",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: AppColors.appGreyColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Container(
                          height: 157.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightGrey, width: 1),
                            color: AppColors.appWhite,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (state.dashboardMetricsModal.treesPlanted)
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text("Number of Trees",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: AppColors.appGreyColor)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Container(
                          height: 157.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightGrey, width: 1),
                            color: AppColors.appWhite,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.dashboardMetricsModal.projectsSupportedCount}",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text("Number of Projects Supported",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: AppColors.appGreyColor)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DashSkeleton extends StatelessWidget {
  const DashSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyShimmerContainer(
        child: Column(
      children: [
        Container(
          height: 157.h,
          color: Colors.black,
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          height: 157.h,
          color: Colors.black,
        ),
        SizedBox(
          height: 7.h,
        ),
        Container(
          height: 157.h,
          color: Colors.black,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    ));
  }
}
