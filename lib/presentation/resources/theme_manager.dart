import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:net_carbons/presentation/resources/color.dart';

ThemeData getThemeData() {
  return ThemeData(
      primaryColor: const Color(0xFF333333),
      fontFamily: 'Work Sans',
      scaffoldBackgroundColor: Colors.white,

      // primaryColor: ColorManager.primary,
      // primaryColorDark: ColorManager.darkPrimary,
      // primaryColorLight: ColorManager.primaryOpacity70,
      // disabledColor: ColorManager.grey1,
      // colorScheme:
      //     ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
      // splashColor: ColorManager.primaryOpacity70,
      //card t
      cardTheme: CardTheme(
        elevation: 4.w,
        // color: ColorManager.white,
        // shadowColor: ColorManager.grey2,
      ),

      /// fontHeight / font size = height ratio
      //text theme
      textTheme: TextTheme(
        ///UI KIT
        headline1: GoogleFonts.workSans(
          fontSize: 32.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryActiveColor,
        ),
        headline2: GoogleFonts.workSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.appWhite,
        ),

        subtitle1: GoogleFonts.workSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),

        subtitle2: GoogleFonts.workSans(
            color: AppColors.appGreyColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            height: 1.2),
        bodyText1: GoogleFonts.workSans(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryActiveColor),
        bodyText2: GoogleFonts.workSans(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryActiveColor),
        // //login sign up titles
        // headline3: GoogleFonts.workSans(
        //     fontSize: 20.sp,
        //     fontWeight: FontWeight.w500,
        //     color: AppColors.primaryActiveColor),
        //
        // ///used
        // headline4: GoogleFonts.workSans(
        //     color: AppColors.primaryActiveColor,
        //     fontSize: 18.sp,
        //     fontWeight: FontWeight.w600,
        //     letterSpacing: 0.25),
        // //used
        // headline5: GoogleFonts.workSans(
        //     fontSize: 24.sp,
        //     letterSpacing: .016,
        //     fontWeight: FontWeight.w400,
        //     color: AppColors.appGreyColor),
        // headline6: GoogleFonts.workSans(
        //     fontSize: 21.sp, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        //
        // ///used
        // bodyText2: GoogleFonts.workSans(
        //   fontSize: 15.sp,
        //   fontWeight: FontWeight.w400,
        //   letterSpacing: 0.25,
        //   color: AppColors.appGreyColor,
        // ),
        //
        // ///used
        // button: GoogleFonts.workSans(
        //     fontSize: 18.sp,
        //     fontWeight: FontWeight.w600,
        //     letterSpacing: 1.25,
        //     color: AppColors.appWhite),
        // //used
        // caption: GoogleFonts.workSans(
        //   fontSize: 16.sp,
        //   fontWeight: FontWeight.w400,
        //   letterSpacing: 0.4,
        // ),
        // overline: GoogleFonts.workSans(
        //     decoration: TextDecoration.lineThrough,
        //     fontSize: 16.sp,
        //     fontWeight: FontWeight.w400,
        //     letterSpacing: .1,
        //     color: AppColors.appGreyColor),
        // labelMedium: GoogleFonts.workSans(
        //   fontSize: 16.sp,
        //   fontWeight: FontWeight.w500,
        //   letterSpacing: 1,
        // ),
      ),

      //input theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(8.w),
        labelStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.lightGrey),
        // hintStyle: getRegularTextStyle(color: ColorManager.grey1),
        // errorStyle: getRegularTextStyle(color: ColorManager.error),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.lightGrey, width: 1.w),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide:
              BorderSide(color: AppColors.lightGrey.withOpacity(.5), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.lightGrey, width: 1.w),
        ),
        //error border
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red, width: 1.w),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: AppColors.lightGrey, width: 1.w),
        ),
      ));
}
