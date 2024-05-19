import 'dart:convert';
import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgManager;
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/constants/a2_a3.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/constants/svg_flags.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/all_countries/repository/repository.dart';
import 'package:net_carbons/domain/countries/model/country_modal.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/onboarding/screen_quote.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/texts.dart';

import '../resources/route_manager.dart';

class ScreenChooseCountry extends StatefulWidget {
  const ScreenChooseCountry({Key? key}) : super(key: key);

  @override
  State<ScreenChooseCountry> createState() => _ScreenChooseCountryState();
}

class _ScreenChooseCountryState extends State<ScreenChooseCountry> {
  final repository = getIt<CountriesRepository>();

  CountryModal? selectedCountry;
  CountryModal? selectedCountryLocal;

  bool firstRun = true;
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    final locale = CountryCodes.getDeviceLocale();
    final CountryDetails details = CountryCodes.detailsForLocale(locale);
    final alpha3code =
        countryCodesConvertA2ToA3(a2Code: details.alpha2Code ?? '');
    final CountryModal countryModal = CountryModal(
        id: '',
        entity: details.localizedName ?? "",
        countryCode: alpha3code ?? "USA",
        currencyName: '',
        currencyCode: '',
        numericCode: '',
        minorUnit: '',
        carbonCountryCode: '',
        carbonCountryPerCapita: '',
        phonePrefix: details.dialCode ?? "",
        status: '',
        show: '',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        v: 0,
        isCurrencySupported: false);

    selectedCountryLocal = countryModal;
  }

  bool loading = false;
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 446.h,
            child: Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: AppColors.appWhite,
                    // image: DecorationImage(
                    //     fit: BoxFit.cover,
                    //     image: AssetImage(ImageAssets.chooseCountryPageImage)),
                  ),
                  child: Image.asset(
                    ImageAssets.chooseCountryPageImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SafeArea(
                  child: LogoBar(),
                )
              ],
            ),
          ),
          Container(
            height: 4.h,
          ),
          Container(
            padding: EdgeInsets.only(
              left: 24.5.w,
              right: 24.5.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppTexts.chooseYourCountry,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(height: 1.0),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: 5.h,
                ),
                Text(
                  AppTexts.firstStepBeforeUsingNetcarbons,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(height: 1.46, color: AppColors.appGreyColor),
                ),
                Container(
                  height: 66.h,
                ),
                SizedBox(
                    height: 45.h,
                    child: BlocBuilder<AppControllerBloc, AppControllerState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return CupertinoActivityIndicator();
                        }
                        if (state.countries.isNotEmpty) {
                          if (state.countries.isNotEmpty) {
                            firstRun == true
                                ? selectedCountry = state.countries.firstWhere(
                                    (element) {
                                    return element.countryCode ==
                                        state.countryModal?.countryCode;
                                  },
                                    orElse: () => state.countries.firstWhere(
                                        (element) =>
                                            element.countryCode ==
                                            selectedCountryLocal?.countryCode,
                                        orElse: () =>
                                            state.countries.firstWhere(
                                              (element) =>
                                                  element.countryCode == "USA",
                                            )))
                                : null;
                          }
                          firstRun = false;
                          return Center(
                              child: Container(
                                  height: 45.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.appGreyColor,
                                          width: .5)),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 18.w),
                                  width: double.maxFinite,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<CountryModal>(
                                      icon: Center(
                                          child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 32.sp,
                                      )),
                                      hint: const Text("Or Select a Country"),
                                      value: selectedCountry,
                                      isDense: true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedCountry = newValue;
                                          selectedCountryLocal = newValue;
                                        });
                                      },
                                      items: state.countries.map((country) {
                                        return DropdownMenuItem<CountryModal>(
                                          value: country,
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.transparent,
                                                radius: 15.w,
                                                child: ClipOval(
                                                  child: SvgPicture.asset(
                                                    'assets/flags_svg/${flags[country.countryCode ?? 'USA']}',
                                                    width: 30
                                                        .w, // Set width and height to properly fit inside the CircleAvatar
                                                    height: 30.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 13.w,
                                              ),
                                              Text(
                                                country.entity.length < 22
                                                    ? country.entity
                                                    : "${country.entity.substring(0, 21)}...",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )));
                        }
                        if (state.countries.isEmpty) {
                          return Center(
                              child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ///TODO: Border design change
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.lightGrey,
                                            width: 1)),
                                    height: 45.h,
                                    padding: EdgeInsets.all(8.w),
                                    width: double.maxFinite,
                                    child: Center(
                                      child: Text(
                                        selectedCountryLocal?.entity ?? "",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                color: AppColors.lightGrey,
                                                height: 1.2),
                                      ),
                                    )),
                              ),

                              TextButton(
                                onPressed: () async {
                                  BlocProvider.of<AppControllerBloc>(context)
                                      .add(AppControllerEvent.fetchCountries());
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ));
                        }
                        return Container();
                      },
                    )),
              ],
            ),
          ),
          Container(
            height: 98.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.5.w),
            child: AppButton(
              padding: EdgeInsets.zero,
              onTap: () {
                if (selectedCountry != null) {
                  // repository.saveCountryToLocal(selectedCountry!, true);
                  BlocProvider.of<AppControllerBloc>(context).add(
                      AppControllerEvent.updateCountry(
                          countryModal: selectedCountry!));

                  final state =
                      BlocProvider.of<AppControllerBloc>(context).state;

                  final currencyAvailable = state.currencyList.any((element) =>
                      element.currencyCode == selectedCountry!.currencyCode);

                  BlocProvider.of<AppControllerBloc>(context).add(
                      AppControllerEvent.updateCurrency(
                          currency: currencyAvailable
                              ? selectedCountry!.currencyCode
                              : "USD"));
                  final authState = BlocProvider.of<AuthBloc>(context).state;
                  if (authState is Authenticated) {
                    BlocProvider.of<UserProfileBloc>(context).add(
                        UserProfileEvent.saveMyProfile(data: {
                      'selectedCountry': selectedCountry!.countryCode
                    }));
                  }

                  Navigator.pushNamed(context, Routes.onBoardingScreen);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(!hasError
                          ? "Please select a Country"
                          : 'Retry with a internet connection')));
                }
              },
              text: Text(
                ButtonStrings.continueText,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(height: 1.22),
              ),
              filled: true,
              height: 60.h,
              feedbackTimeText: Text(
                ButtonStrings.continueText,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                    height: 1.22, color: AppColors.primaryActiveColor),
              ),
            ),
          ),
          Container(
            height: 68.h,
          ),
        ],
      ),
    ));
  }
}

// //////////////
