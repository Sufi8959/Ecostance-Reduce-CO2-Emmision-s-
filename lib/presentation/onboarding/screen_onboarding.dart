import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/texts.dart';

import '../resources/route_manager.dart';

class ScreenOnBoarding extends StatefulWidget {
  const ScreenOnBoarding({Key? key}) : super(key: key);

  @override
  State<ScreenOnBoarding> createState() => _ScreenOnBoardingState();
}

class _ScreenOnBoardingState extends State<ScreenOnBoarding> {
  List<Map<String, dynamic>> pagesData = [];
  late PageController _pageController;
  int currentPage = 0;
  late AuthState authState;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {});
    authState = BlocProvider.of<AuthBloc>(context).state;

    ///TODO: Assets needs to be changed with new
    pagesData.addAll([
      {'image': ImageAssets.onBoardingImage1, 'text': AppTexts.onBoardingText1},
      {'image': ImageAssets.onBoardingImage2, 'text': AppTexts.onBoardingText2},
      {'image': ImageAssets.onBoardingImage3, 'text': AppTexts.onBoardingText3},
    ]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 618.h,
                      width: double.maxFinite,
                      child: PageView.builder(
                        onPageChanged: (newIndex) {
                          setState(
                            () {
                              currentPage = newIndex;
                            },
                          );
                        },
                        controller: _pageController,
                        itemCount: pagesData.length,
                        itemBuilder: (_, index) {
                          return Stack(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(pagesData[index]['image']),
                                      fit: BoxFit.cover),
                                ),
                                height: 445.h,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: -40.h,
                                      left: 0,
                                      child: Image.asset(
                                        ImageAssets.onBoardingSvg,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 450.h,
                                right: 0,
                                left: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Text(
                                        AppTexts.welcomeToNetCarbons,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            ?.copyWith(
                                                height: 1.15,
                                                color: AppColors
                                                    .primaryActiveColor),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 22.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Text(
                                        pagesData[index]['text'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                              height: 1.4,
                                              color: AppColors.appGreyColor,
                                            ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 45.h,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SizedBox(
                        height: 5,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: pagesData.length,
                          itemBuilder: (_, index) {
                            return Container(
                              width: 60.w,
                              height: 4.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: currentPage == index
                                    ? AppColors.primaryActiveColor
                                    : AppColors.primaryInactive,
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 8.w,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 50.h,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          height: 60.h,
                          filled: true,
                          onTap: () {
                            if (currentPage == pagesData.length - 1) {
                              _skip(state);

                              return;
                            }
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInSine);
                          },
                          text: Text(
                            ButtonStrings.next,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          outlineColor: AppColors.lightGrey,
                          feedbackTimeText: Text(
                            ButtonStrings.next,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: AppColors.primaryActiveColor),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        AppButton(
                          height: 60.h,
                          onTap: () {
                            _skip(state);
                          },
                          text: Text(
                            AppTexts.skip,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: AppColors.primaryActiveColor),
                          ),
                          feedbackTimeText: Text(
                            AppTexts.skip,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: AppColors.appWhite),
                          ),
                        )
                      ],
                    ),
                  )),
              Positioned(
                top: 0,
                left: 16.w,
                right: 16.w,
                child: SafeArea(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${currentPage + 1}/${pagesData.length}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        const Expanded(child: LogoBar()),
                        GestureDetector(
                          onTap: () {
                            _skip(state);
                          },
                          child: Text(
                            AppTexts.skip,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _skip(AuthState state) {
    if (state is Authenticated) {
      Navigator.pushNamed(context, Routes.chooseActionScreen);
    } else {
      Navigator.pushNamed(context, Routes.startScreen);
    }
  }
}
