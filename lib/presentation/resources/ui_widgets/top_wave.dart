import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

import '../assets.dart';

class TopWave extends StatelessWidget {
  const TopWave({
    Key? key,
    required this.height,
    this.bgColor,
  }) : super(key: key);
  final double height;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: height,
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.appWhite,
            image: const DecorationImage(
                fit: BoxFit.fitWidth, image: AssetImage(ImageAssets.topWave))));
  }
}

PreferredSize buildAppAppBar(Function backAction,
    {Widget? actionBuilder,
    PreferredSizeWidget? bottom,
    Color? backgroundColor,
    bool? hideWave}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(bottom == null ? 48.h : 95.h),
    child: AppBar(
      automaticallyImplyLeading: false,
      bottom: bottom,
      centerTitle: true,
      elevation: 0,
      flexibleSpace: hideWave == null
          ? TopWave(
              bgColor: backgroundColor,
              height: 80.h,
            )
          : hideWave
              ? Container(
                  height: 80.h,
                )
              : TopWave(
                  bgColor: backgroundColor,
                  height: 80.h,
                ),
      backgroundColor: backgroundColor ?? AppColors.appWhite,
      title: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        backAction();
                      },
                      child: SizedBox(
                        width: 40.h,
                        height: 40.h,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  padding: EdgeInsets.only(left: 4.w),
                                  width: 40.h,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.lightGrey.withOpacity(0),
                                  ),
                                )),
                            Positioned(
                              left: 5.w,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 24.h,
                                  textDirection: TextDirection.ltr,
                                  color: AppColors.primaryActiveColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            const Expanded(child: Center(child: LogoBar())),
            SizedBox(
              width: 100.w,
              child: actionBuilder ??
                  Builder(
                    builder: (context) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 50.w,
                            child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.primaryActiveColor,
                                )),
                          ),
                        ),
                        Opacity(
                          opacity: 0,
                          child: SizedBox(
                            width: 50.w,
                            child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: AppColors.primaryActiveColor,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildProductDetailPageAppBar(
        BuildContext context, Widget actionBuilder) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 40.h,
                          height: 40.h,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 4.w),
                                    width: 40.h,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          AppColors.lightGrey.withOpacity(.3),
                                    ),
                                  )),
                              Positioned(
                                left: 5.w,
                                right: 0,
                                top: 0,
                                bottom: 0,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20.h,
                                    textDirection: TextDirection.ltr,
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: Center(child: LogoBar())),
        SizedBox(
          width: 100.w,
          child: actionBuilder,
        ),
      ],
    );
