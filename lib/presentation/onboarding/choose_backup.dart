// import 'dart:async';

// import 'package:country_codes/country_codes.dart';
// import 'package:dartz/dartz.dart' as dartz;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgManager;
// import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
// import 'package:net_carbons/app/constants/a2_a3.dart';
// import 'package:net_carbons/app/constants/string_constants.dart';
// import 'package:net_carbons/app/constants/svg_flags.dart';
// import 'package:net_carbons/app/dependency.dart';
// import 'package:net_carbons/data/all_countries/repository/repository.dart';
// import 'package:net_carbons/data/core/general/failiure.dart';
// import 'package:net_carbons/domain/countries/model/country_modal.dart';
// import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
// import 'package:net_carbons/presentation/onboarding/screen_quote.dart';
// import 'package:net_carbons/presentation/resources/assets.dart';
// import 'package:net_carbons/presentation/resources/color.dart';
// import 'package:net_carbons/presentation/resources/texts.dart';

// import '../resources/route_manager.dart';

// class ScreenChooseCountry extends StatefulWidget {
//   const ScreenChooseCountry({Key? key}) : super(key: key);

//   @override
//   State<ScreenChooseCountry> createState() => _ScreenChooseCountryState();
// }

// class _ScreenChooseCountryState extends State<ScreenChooseCountry> {
//   final repository = getIt<CountriesRepository>();
//   final double _kItemExtent = 32.0;
//   CountryModal? selectedCountry;
//   CountryModal? selectedCountryLocal;
//   late StreamController<dartz.Either<Failure, List<CountryModal>>>
//       streamController;
//   bool firstRun = true;
//   @override
//   void initState() {
//     streamController = StreamController();
//     init();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     streamController.close();
//     firstRun = true;

//     super.dispose();
//   }

//   void init() async {
//     final locale = CountryCodes.getDeviceLocale();
//     final CountryDetails details = CountryCodes.detailsForLocale(locale);
//     final alpha3code = countryCodesA2ToA3[details.alpha2Code];
//     final CountryModal countryModal = CountryModal(
//         id: '',
//         entity: details.localizedName ?? "",
//         countryCode: alpha3code ?? "USA",
//         currencyName: '',
//         currencyCode: '',
//         numericCode: '',
//         minorUnit: '',
//         carbonCountryCode: '',
//         carbonCountryPerCapita: '',
//         phonePrefix: details.dialCode ?? "",
//         status: '',
//         show: '',
//         createdAt: DateTime.now(),
//         updatedAt: DateTime.now(),
//         v: 0);

//     selectedCountryLocal = countryModal;

//     final res = await repository.fetAllCountries();
//     res.fold((fail) {
//       streamController.add(dartz.Left(fail));
//     }, (success) {
//       streamController.add(dartz.Right(success));
//     });
//   }

//   bool loading = false;
//   bool hasError = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: 391.h,
//             child: Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 391.h,
//                   decoration: const BoxDecoration(
//                     color: AppColors.cartPriceColor,
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(ImageAssets.chooseCountryPageImage)),
//                   ),
//                 ),
//                 const SafeArea(
//                   child: LogoBar(),
//                 )
//               ],
//             ),
//           ),
//           Container(
//             height: 46.h,
//           ),
//           Container(
//             padding: EdgeInsets.only(
//               left: 24.5.w,
//               right: 24.5.w,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   AppTexts.chooseYourCountry,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline1
//                       ?.copyWith(height: 1.15),
//                   textAlign: TextAlign.center,
//                 ),
//                 Container(
//                   height: 5.h,
//                 ),
//                 Text(
//                   AppTexts.firstStepBeforeUsingNetcarbons,
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle2
//                       ?.copyWith(height: 1.46, color: AppColors.appGreyColor),
//                 ),
//                 Container(
//                   height: 66.h,
//                 ),
//                 SizedBox(
//                   height: 45.h,
//                   child:
//                       StreamBuilder<dartz.Either<Failure, List<CountryModal>>>(
//                     stream: streamController.stream,
//                     builder: (BuildContext context,
//                         AsyncSnapshot<dartz.Either<Failure, List<CountryModal>>>
//                             snapshot) {
//                       if (loading) {
//                         return const CupertinoActivityIndicator(
//                           radius: 15,
//                         );
//                       }
//                       if (snapshot.hasData) {
//                         return snapshot.data!.fold((failiure) {
//                           hasError = true;
//                           return Center(
//                               child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               ///TODO: Border design change
//                               Expanded(
//                                 child: Container(
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: AppColors.lightGrey,
//                                             width: 1)),
//                                     height: 45.h,
//                                     padding: EdgeInsets.all(8.w),
//                                     width: double.maxFinite,
//                                     child: Center(
//                                       child: Text(
//                                         selectedCountryLocal?.entity ?? "",
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyText1
//                                             ?.copyWith(
//                                                 color: AppColors.lightGrey,
//                                                 height: 1.2),
//                                       ),
//                                     )),
//                               ),

//                               TextButton(
//                                 onPressed: () async {
//                                   await _retryFetching();
//                                 },
//                                 child: const Text('Retry'),
//                               ),
//                             ],
//                           ));
//                         }, (countries) {
//                           if (countries.isNotEmpty) {
//                             firstRun == true
//                                 ? selectedCountry = countries.firstWhere(
//                                     (element) {
//                                     return element.countryCode ==
//                                         selectedCountryLocal?.countryCode;
//                                   },
//                                     orElse: () => countries.firstWhere(
//                                         (element) =>
//                                             element.countryCode == "USA"))
//                                 : null;
//                           }
//                           firstRun = false;
//                           return Center(
//                             child: countries.isNotEmpty
//                                 ? Container(
//                                     height: 45.h,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: AppColors.appGreyColor,
//                                             width: .5)),
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 18.w),
//                                     width: double.maxFinite,
//                                     child: DropdownButtonHideUnderline(
//                                       child: DropdownButton<CountryModal>(
//                                         icon: Center(
//                                             child: Icon(
//                                           Icons.keyboard_arrow_down,
//                                           size: 32.sp,
//                                         )),
//                                         hint: const Text("Or Select a Country"),
//                                         value: selectedCountry,
//                                         isDense: true,
//                                         onChanged: (newValue) {
//                                           setState(() {
//                                             selectedCountry = newValue;
//                                             selectedCountryLocal = newValue;
//                                           });
//                                         },
//                                         items: countries.map((country) {
//                                           return DropdownMenuItem<CountryModal>(
//                                             value: country,
//                                             child: Row(
//                                               children: [
//                                                 CircleAvatar(
//                                                   backgroundImage:
//                                                       svgManager.Svg(
//                                                     'assets/flags_svg/${flags[country.countryCode ?? 'USA']}',
//                                                   ),
//                                                   backgroundColor:
//                                                       Colors.transparent,
//                                                   radius: 15.w,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 13.w,
//                                                 ),
//                                                 Text(
//                                                   country.entity.length < 22
//                                                       ? country.entity
//                                                       : "${country.entity.substring(0, 21)}...",
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodyText1,
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         }).toList(),
//                                       ),
//                                     ))
//                                 : Row(
//                                     children: [
//                                       const Expanded(
//                                           child: Text(
//                                               "Error in loading countries")),
//                                       TextButton(
//                                         onPressed: () async {
//                                           await _retryFetching();
//                                         },
//                                         child: const Text('Retry'),
//                                       )
//                                     ],
//                                   ),
//                           );
//                         });
//                       } else {
//                         return Center(
//                           child: CupertinoActivityIndicator(
//                             radius: 15.sp,
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 98.h,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 24.5.w),
//             child: AppButton(
//               padding: EdgeInsets.zero,
//               onTap: () async {
//                 if (selectedCountry != null) {
//                   repository.saveCountryToLocal(selectedCountry!, true);
//                   BlocProvider.of<AppControllerBloc>(context).add(
//                       AppControllerEvent.updateCountry(
//                           countryModal: selectedCountry!));
//                   Navigator.pushNamed(context, Routes.onBoardingScreen);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(!hasError
//                           ? "Please select a Country"
//                           : 'Retry with a internet connection')));
//                 }
//               },
//               text: Text(
//                 ButtonStrings.continueText,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline2
//                     ?.copyWith(height: 1.22),
//               ),
//               filled: true,
//               height: 60.h,
//               feedbackTimeText: Text(
//                 ButtonStrings.continueText,
//                 style: Theme.of(context).textTheme.headline2?.copyWith(
//                     height: 1.22, color: AppColors.primaryActiveColor),
//               ),
//             ),
//           ),
//           Container(
//             height: 68.h,
//           ),
//         ],
//       ),
//     ));
//   }

//   Future<void> _retryFetching() async {
//     setState(() {
//       loading = true;
//     });
//     final future = await repository.fetAllCountries();
//     future.fold((fail) {
//       streamController.add(dartz.Left(fail));
//       setState(() {
//         loading = false;
//       });
//     }, (success) {
//       streamController.add(dartz.Right(success));
//       setState(() {
//         loading = false;
//       });
//     });
//   }
// }
