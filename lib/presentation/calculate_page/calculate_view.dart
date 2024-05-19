import 'dart:ui';

import 'package:colorful_slider/colorful_slider.dart';
import 'package:flag/flag.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgManager;
import 'package:net_carbons/app/constants/a3_a2.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/constants/svg_flags.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/presentation/calculate_page/bloc/calculate_bloc.dart';
import 'package:net_carbons/presentation/calculate_page/widgets/custm_slider.dart';
import 'package:net_carbons/presentation/calculate_page/widgets/custom_thumb.dart';
import 'package:net_carbons/presentation/calculate_page/widgets/skeleton.dart';
import 'package:net_carbons/presentation/calculate_page/widgets/toggleTab.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';

import '../../app/app_controller/app_controller_bloc.dart';
import '../../domain/countries/model/country_modal.dart';
import '../app_widgets/outlined_button.dart';
import '../resources/assets.dart';
import '../resources/color.dart';
import '../resources/ui_widgets/top_wave.dart';
import 'calculate_page.dart';

class CalculateView extends StatelessWidget {
  const CalculateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<CalculateBloc>(context).add(const CalculateEvent.started());
    return Scaffold(
      appBar: buildAppAppBar(() {
        Navigator.pop(context);
      }),
      body: BlocBuilder<AppControllerBloc, AppControllerState>(
        builder: (context, appState) {
          return BlocBuilder<CalculateBloc, CalculateState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const CalculateViewSkeleton();
              }
              if (state.countries.isEmpty && !state.isLoading) {
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.errorMessage ??
                          "Error in getting countries dat, Can't Calculate your emission "),
                      CupertinoButton(
                          child: const Text('Reload'),
                          onPressed: () {
                            BlocProvider.of<CalculateBloc>(context)
                                .add(const CalculateEvent.started());
                          })
                    ],
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Center(
                          child: SizedBox(
                        height: 28.h,
                        child: Text(
                          "Calculate my carbon footprint",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                      )),
                      SizedBox(
                        height: 16.h,
                      ),
                      state.countries.isNotEmpty
                          ? Center(
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.lightGrey,
                                          width: 1)),
                                  padding: EdgeInsets.all(4.w),
                                  width: double.maxFinite,
                                  height: 45.h,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<CountryModal>(
                                      isExpanded: true,
                                      iconSize: 24.sp,
                                      hint: const Text("Or Select a Country"),
                                      value: state.selectedCountry,
                                      isDense: true,
                                      onChanged: (newValue) {
                                        BlocProvider.of<CalculateBloc>(context)
                                            .add(CalculateEvent
                                                .selectedCountryChanged(
                                                    newValue));
                                      },
                                      items: state.countries.map((country) {
                                        String countryCode =
                                            country.countryCode;
                                        return DropdownMenuItem<CountryModal>(
                                          value: country,
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              if (countryCodesConvertA3ToA2(
                                                      a3Code: countryCode) !=
                                                  null)
                                                Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.white),
                                                        shape: BoxShape.circle),
                                                    width: 38.h,
                                                    height: 38.h,
                                                    child: Flag.fromString(
                                                      countryCodesConvertA3ToA2(
                                                          a3Code: countryCode)!,
                                                      flagSize:
                                                          FlagSize.size_1x1,
                                                      borderRadius: 20.h,
                                                      fit: BoxFit.cover,
                                                    )),
                                              if (countryCodesConvertA3ToA2(
                                                      a3Code: countryCode) ==
                                                  null)
                                                Text(countryCode),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 13.w),
                                                child: Text(
                                                  country.entity.length < 22
                                                      ? "${country.entity} "
                                                      : "${country.entity.substring(0, 21)}... ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                          color: AppColors
                                                              .primaryActiveColor),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.w),
                                                child: Text(
                                                  country
                                                      .carbonCountryPerCapita,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                          color: AppColors
                                                              .primaryActiveColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            )
                          : CupertinoActivityIndicator(),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        ' Metric tons of carbon emission per person ',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CalculateResultView(
                        calculatorResultValue: state.calculatorResultValue,
                      ),

                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        "Members in your household ",
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: AppColors.appGreyColor),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 18.w,
                            child: Center(
                              child: Text(
                                '1',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(fontSize: 14.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.r),
                                                  bottomLeft:
                                                      Radius.circular(10.r)),
                                              color: AppColors.selectedGreen),
                                          height: 21.1.h,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: AppColors
                                                  .inactiveSliderTrack),
                                          height: 21.1.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      trackHeight: 21.1.h,
                                      thumbShape: CustomSliderThumbCircle(
                                          min: 1, max: 10, thumbRadius: 12.r),
                                      trackShape:
                                          CustomRoundedRectSliderTrackShape(
                                        min: 1,
                                        max: 10,
                                        value: state.noOfPeople.toDouble(),
                                      ),
                                      overlayShape:
                                          SliderComponentShape.noOverlay,
                                      inactiveTrackColor:
                                          AppColors.inactiveSliderTrack,
                                      activeTrackColor: AppColors.selectedGreen,
                                      valueIndicatorShape:
                                          SliderComponentShape.noThumb,
                                      inactiveTickMarkColor: Colors.transparent,
                                      activeTickMarkColor: Colors.transparent,
                                    ),
                                    child: Slider(
                                      label: state.noOfPeople.toString(),
                                      focusNode: FocusNode(),
                                      divisions: 10,
                                      value: state.noOfPeople.toDouble(),
                                      onChanged: (newVal) {
                                        BlocProvider.of<CalculateBloc>(context)
                                            .add(NoOfPeopleChanged(
                                                newVal.floor()));
                                        if (state.noOfPeopleUsingTransport >
                                            newVal) {
                                          BlocProvider.of<CalculateBloc>(
                                                  context)
                                              .add(
                                                  NoOfPeopleUsingTransportChanged(
                                                      newVal.floor()));
                                        }
                                      },
                                      max: 10,
                                      min: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 28.w,
                            child: Center(
                              child: Text(
                                '10+',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      letterSpacing: .1,
                                    ),
                                maxLines: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // SizedBox(
                      //   child: NoThumpSlider(
                      //
                      //     activeRadius: 100,
                      //     inActiveRadius: 10,
                      //     thumpValueAlignment: Alignment.centerRight,
                      //     valueDecimalLimit: 0,
                      //     height: 21.h,
                      //     currentValue: 1,
                      //     inactiveColor: Colors.black,
                      //     activeColor: Colors.red,
                      //     totalValue: 10,
                      //     width: double.maxFinite,
                      //     showValueOnThump: true,
                      //     valueThumpStyle: const TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //     thumpValuePadding:
                      //         const EdgeInsets.symmetric(horizontal: 16),
                      //     onchanged: (newVal) {
                      //       // BlocProvider.of<CalculateBloc>(context)
                      //       //     .add(NoOfPeopleChanged(newVal.floor()));
                      //     },
                      //   ),
                      // ),
                      Text(
                        "Members using public transportation",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: AppColors.appGreyColor),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 18.w,
                            child: Center(
                              child: Text(
                                '0',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        letterSpacing: .1, fontSize: 14.sp),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 1.h,
                                  bottom: 1.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(10.r),
                                                  bottomLeft:
                                                      Radius.circular(10.r)),
                                              color: AppColors.selectedGreen),
                                          height: 21.1.h,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              color: AppColors
                                                  .inactiveSliderTrack),
                                          height: 21.1.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 4.w),
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      trackShape:
                                          CustomRoundedRectSliderTrackShape(
                                              min: 0,
                                              max: state.noOfPeople,
                                              value: state
                                                  .noOfPeopleUsingTransport
                                                  .toDouble()),
                                      trackHeight: 21.4.h,
                                      thumbShape: CustomSliderThumbCircle(
                                          min: 0,
                                          max: state.noOfPeople,
                                          // thumbHeight: 22.5.h,
                                          // thumbWidth: 30.w,
                                          thumbRadius: 12.r),
                                      overlayShape:
                                          SliderComponentShape.noOverlay,
                                      inactiveTrackColor:
                                          AppColors.inactiveSliderTrack,
                                      activeTrackColor: AppColors.selectedGreen,
                                      valueIndicatorShape:
                                          SliderComponentShape.noThumb,
                                      inactiveTickMarkColor: Colors.transparent,
                                      activeTickMarkColor: Colors.transparent,
                                    ),
                                    child: Slider(
                                      value: state.noOfPeopleUsingTransport
                                          .toDouble(),
                                      min: 0,
                                      max: state.noOfPeople.toDouble(),
                                      divisions: state.noOfPeople.toInt(),
                                      label: state.noOfPeopleUsingTransport
                                          .toString(),
                                      onChanged: (value) {
                                        BlocProvider.of<CalculateBloc>(context)
                                            .add(CalculateEvent
                                                .noOfPeopleUsingTransportChanged(
                                                    value.floor()));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SizedBox(
                            width: 28.w,
                            child: Center(
                              child: Text(
                                "${state.noOfPeople.toString()}${state.noOfPeopleUsingTransport == 10 ? '+' : ''}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      letterSpacing: .1,
                                    ),
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 10.h,
                      ),

                      ///main
                      Column(
                        children: [
                          ToggleTab(
                            selectedIndex: state.incomeValue,
                            onChanged: (index) {
                              BlocProvider.of<CalculateBloc>(context).add(
                                  CalculateEvent.incomeChanged(
                                      indexAsKey[index]!));
                            },
                            title: 'Income',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ToggleTab(
                            selectedIndex: state.houseSizeValue,
                            onChanged: (index) {
                              BlocProvider.of<CalculateBloc>(context).add(
                                  CalculateEvent.houseSizeChanged(
                                      indexAsKey[index]!));
                            },
                            title: 'House Size',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ToggleTab(
                            selectedIndex: state.airTravelValue,
                            onChanged: (index) {
                              BlocProvider.of<CalculateBloc>(context).add(
                                  CalculateEvent.airTravelChanged(
                                      indexAsKey[index]!));
                            },
                            title: 'Air Travel',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ToggleTab(
                            selectedIndex: state.meatEggFishValue,
                            onChanged: (index) {
                              BlocProvider.of<CalculateBloc>(context).add(
                                  CalculateEvent.meatEggFishChanged(
                                      indexAsKey[index]!));
                            },
                            title: 'Meat/Fish/Egg Consumption',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      AppButton2(
                        isLoading: state.isProductLoading,
                        height: 50.h,
                        filled: true,
                        onTap: () {
                          BlocProvider.of<CalculateBloc>(context).add(
                              CalculateEvent.saveEmissionInServerOnClick(
                                  state.calculatorResultValue));
                          if (state.productWithLeastPrice == null &&
                              !state.isProductLoading) {
                            BlocProvider.of<CalculateBloc>(context)
                                .add(const CalculateEvent.getLeastProduct());
                          }
                          if (state.isProductLoading ||
                              state.productWithLeastPrice == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Wait for a minute, a product is still loading')));
                            return;
                          }
                          if (state.selectedCountry == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('No country selected')));
                            return;
                          } else {
                            if (double.tryParse(state
                                    .selectedCountry!.carbonCountryPerCapita) !=
                                0.0) {
                              calculatorSelectedPageNotifier.value = 1;
                              BlocProvider.of<CalculateBloc>(context).add(
                                  CalculateEvent.saveEmissionInServer(
                                      state.calculatorResultValue));
                            }
                          }
                        },
                        text: Text(ButtonStrings.continueText,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: AppColors.appWhite)),
                        feedbackTimeText: Text(ButtonStrings.continueText,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    color: AppColors.primaryActiveColor)),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CalculateResultView extends StatelessWidget {
  const CalculateResultView({
    Key? key,
    required this.calculatorResultValue,
  }) : super(key: key);

  final double calculatorResultValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculateBloc, CalculateState>(
      builder: (context, state) {
        return SizedBox(
          height: 63.h,
          width: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  height: 63.h,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            ImageAssets.calculateResultBg,
                          ))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 40.w,
                      ),
                      Text(
                        calculatorResultValue.toStringAsFixed(1),
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(fontSize: 48.sp),
                      ),
                      SizedBox(width: 8.w),
                      Flexible(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                """My annual carbon footprint """,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 15.sp,
                                        letterSpacing: .0001,
                                        color: AppColors.primaryActiveColor),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                              Text(
                                """Metric tons of carbon""",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        letterSpacing: .0001,
                                        color: AppColors.primaryActiveColor),
                                maxLines: 1,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              state.emissionLoading
                  ? Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: state.emissionLoading ? .3 : 0.0,
                        child: Container(
                          color: AppColors.lightGrey,
                          child: const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   top: 0,
              //   bottom: 0,
              //   child: Opacity(
              //     opacity:
              //         state.emissionSavingStatus == EmissionSavingStatus.failed
              //             ? .5
              //             : 0.0,
              //     child: Container(
              //       color: AppColors.cherryRed,
              //       child: const Center(
              //         child: CupertinoActivityIndicator(),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        );
      },
    );
  }
}
