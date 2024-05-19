import 'dart:io';
import 'package:intl_phone_field/phone_number.dart';
import 'package:net_carbons/app/constants/a2_a3.dart';
import 'package:net_carbons/app/constants/currency_symbol.dart';

import '../../../../app/extensions.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgManager;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/constants/a3_a2.dart';
import 'package:net_carbons/app/constants/svg_flags.dart';
import 'package:net_carbons/app/utils/image_utils.dart';
import 'package:net_carbons/domain/countries/model/country_modal.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/app_widgets/text_input_field.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../../../checkout/checkout_views/address_page_view.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ScreenMyProfile extends StatefulWidget {
  const ScreenMyProfile({Key? key}) : super(key: key);

  @override
  State<ScreenMyProfile> createState() => _ScreenMyProfileState();
}

class _ScreenMyProfileState extends State<ScreenMyProfile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController birthDayController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  PhoneNumber? phoneNumber;

  bool firstRun = true;

  CountryModal? selectedCountry;

  CurrencyAndSymbol? selectedCurrencyAndSymbol;

  DateTime? selectedDate;

  XFile? selectedImage;

  String? existingImageUrl;

  @override
  void initState() {
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.fetchProfile());
    super.initState();
  }

  ScrollController scrollController = ScrollController();

  final Map<String, GlobalKey<FormState>> formKey = {
    "firstNameKey": GlobalKey<FormState>(),
    "lastNameKey": GlobalKey<FormState>(),
    "phoneKey": GlobalKey<FormState>(),
    "countryKey": GlobalKey<FormState>(),
    "currencyKey": GlobalKey<FormState>(),
  };
  final Map<String, FocusNode> nodes = {
    "firstNameKey": FocusNode(),
    "lastNameKey": FocusNode(),
    "countryKey": FocusNode(),
    "currencyKey": FocusNode(),
    "phoneKey": FocusNode(),
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppControllerBloc, AppControllerState>(
      builder: (context, appControllerBlocState) {
        return BlocConsumer<UserProfileBloc, UserProfileState>(
          listenWhen: (p, c) => p.saveProfileStatus != c.saveProfileStatus,
          listener: (context, state) {
            if (mounted) {
              if (state.saveProfileStatus == SaveProfileStatus.failed &&
                  state.showASnackBar) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Error in saving profile")));
                BlocProvider.of<UserProfileBloc>(context)
                    .add(const UserProfileEvent.setSnackBar(false, null));
                Future.delayed(const Duration(seconds: 5), () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                });
                //  Navigator.pop(context);
              }
              if (state.saveProfileStatus == SaveProfileStatus.success) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Profile saved")));
                BlocProvider.of<UserProfileBloc>(context)
                    .add(const UserProfileEvent.setSnackBar(false, null));
                Future.delayed(const Duration(seconds: 5), () {
                  if (mounted) {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  }
                });
                Navigator.pop(context);
              }
            }
          },
          builder: (context, state) {
            if (firstRun) {
              firstNameController.text =
                  state.userProfileModal?.user.firstName ?? '';
              lastNameController.text =
                  state.userProfileModal?.user.lastName ?? '';

              if (state.userProfileModal != null) {
                if (state.userProfileModal!.user.phoneNumber != null) {
                  phoneNumber = state.userProfileModal!.user.phoneNumber!;
                  _phoneController.text = phoneNumber?.number ?? '';
                }
              }

              // phoneNumber =
              //     state.userProfileModal?.billingAddress?.contactNo ?? '';

              selectedDate = state.userProfileModal?.user.dob;

              mapAndInitCountry(appControllerBlocState, state);
              if (state.userProfileModal != null) {
                existingImageUrl =
                    state.userProfileModal!.user.profileImage.isNotEmpty
                        ? state.userProfileModal!.user.profileImage
                        : null;
              }

              firstRun = false;
            }

            return ModalProgressHUD(
              inAsyncCall: state.isLoading,
              progressIndicator: const CupertinoActivityIndicator(),
              child: Scaffold(
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
                              "My Profile",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: .5,
                                      fontSize: 16,
                                      color: AppColors.primaryActiveColor),
                            ),
                          ),
                        )),
                    backgroundColor: AppColors.primaryInactive,
                    hideWave: true),
                backgroundColor: AppColors.scaffoldColor,
                body: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 12.h,
                          ),
                          GestureDetector(
                            onTap: () async {
                              await _selectImage(context).then((value) async {
                                if (value != null) {
                                  final image =
                                      await ImageUtils.cropImage(value.path);
                                  if (image != null) {
                                    setState(() {
                                      selectedImage = image;
                                      existingImageUrl = null;
                                    });
                                  }
                                }
                              });
                            },
                            child: SizedBox(
                              height: 100.h,
                              width: 100.h,
                              child: ImagePlaceHolder(
                                image: selectedImage,
                                existingImage: existingImageUrl,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 53.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Form(
                                key: formKey['firstNameKey'],
                                child: InputField(
                                  onChanged: (data) => formKey['firstNameKey']
                                      ?.currentState
                                      ?.validate(),
                                  focusNode: nodes['firstNameKey'],
                                  textEditingController: firstNameController,
                                  label: 'First name',
                                  hintText: '',
                                  onFocused: () {},
                                  onUnfocused: () => formKey['firstNameKey']
                                      ?.currentState
                                      ?.validate(),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter a valid name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Form(
                                key: formKey['lastNameKey'],
                                child: InputField(
                                  onChanged: (data) => formKey['lastNameKey']
                                      ?.currentState
                                      ?.validate(),
                                  focusNode: nodes['lastNameKey'],
                                  textEditingController: lastNameController,
                                  label: 'Last name',
                                  onFocused: () {},
                                  onUnfocused: () => formKey['lastNameKey']
                                      ?.currentState
                                      ?.validate(),
                                  hintText: '',
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter a valid name';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Birthday",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            color:
                                                AppColors.primaryActiveColor),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showDatePicker(context, selectedDate);
                                    },
                                    child: Container(
                                      height: 45.h,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.appGreyColor,
                                              width: .5)),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 18.w),
                                      width: double.maxFinite,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            selectedDate != null
                                                ? DateFormat('yyyy-MM-dd')
                                                    .format(selectedDate!)
                                                : '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Contact No.",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Form(
                                    key: formKey['phoneKey'],
                                    child: IntlPhoneField(
                                      controller: _phoneController,
                                      validator: (val) {
                                        return val?.isValid(
                                            message: "Enter a valid number");
                                      },
                                      invalidNumberMessage:
                                          "Enter a valid number",
                                      focusNode: nodes['phoneKey'],
                                      initialValue: phoneNumber?.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                      onCountryChanged: (country) {
                                        setState(() {
                                          phoneNumber = null;
                                          _phoneController.clear();
                                        });
                                      },
                                      initialCountryCode: phoneNumber == null
                                          ? countryCodesConvertA3ToA2(
                                              a3Code: selectedCountry
                                                      ?.countryCode ??
                                                  '')
                                          : countryCodesConvertA3ToA2(
                                                  a3Code: phoneNumber!
                                                      .countryISOCode) ??
                                              '',
                                      onChanged: (phone) {
                                        setState(() {
                                          phoneNumber = phone;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(
                              //   height: 30.h,
                              // ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Text(
                              //           "Country",
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .subtitle1
                              //               ?.copyWith(
                              //                   color: AppColors
                              //                       .primaryActiveColor),
                              //         ),
                              //         Tooltip(
                              //             message: "The country",
                              //             triggerMode: TooltipTriggerMode.tap,
                              //             child: Container(
                              //               padding: EdgeInsets.symmetric(
                              //                   vertical: 2.h),
                              //               width: 24.w,
                              //               child: Icon(
                              //                 Icons.info_outline_rounded,
                              //                 size: 14.r,
                              //               ),
                              //             ))
                              //       ],
                              //     ),
                              //     SizedBox(
                              //       height: 9.h,
                              //     ),
                              //     Container(
                              //       height: 45.h,
                              //       decoration: BoxDecoration(
                              //           border: Border.all(
                              //               color: AppColors.appGreyColor,
                              //               width: .5)),
                              //       padding:
                              //           EdgeInsets.symmetric(horizontal: 18.w),
                              //       width: double.maxFinite,
                              //       child: Row(
                              //         children: [
                              //           SizedBox(
                              //             width: 35.w,
                              //             height: 23.3.h,
                              //             child: Image(
                              //               image: svgManager.Svg(
                              //                 'assets/flags_svg/${flags[selectedCountry?.countryCode ?? 'USA']}',
                              //               ),
                              //               // backgroundColor: Colors.transparent,
                              //               // radius: 15.w,
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //           SizedBox(
                              //             width: 13.w,
                              //           ),
                              //           Text(
                              //             " ${selectedCountry != null ? selectedCountry!.entity.length < 22 ? selectedCountry?.entity ?? '' : '${selectedCountry?.entity.substring(0, 21)}...' : ''} |  ${selectedCountry!.isCurrencySupported ? "${selectedCountry!.currencyCode}(${getCurrencySymbol(selectedCountry!.currencyCode)})" : "USD(${getCurrencySymbol("USD")})"}",
                              //             style: Theme.of(context)
                              //                 .textTheme
                              //                 .bodyText1,
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //
                              //   ],
                              // ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Mobile Selected Country",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                                color: AppColors
                                                    .primaryActiveColor),
                                      ),
                                      Tooltip(
                                          message: "The country",
                                          triggerMode: TooltipTriggerMode.tap,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.h),
                                              width: 24.w,
                                              child: Icon(
                                                Icons.info_outline_rounded,
                                                size: 14.r,
                                              )))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.appGreyColor,
                                            width: .5)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.w),
                                    width: double.maxFinite,
                                    child: Row(
                                      children: [
                                        // SizedBox(
                                        //   width: 35.w,
                                        //   height: 23.3.h,
                                        //   child: Image(
                                        //     image: svgManager.Svg(
                                        //       'assets/flags_svg/${flags[appControllerBlocState.countryModal?.countryCode]}',
                                        //     ),
                                        //     // backgroundColor: Colors.transparent,
                                        //     // radius: 15.w,
                                        //     fit: BoxFit.cover,
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   width: 13.w,
                                        // ),
                                        Text(
                                          " ${appControllerBlocState.countryModal != null ? appControllerBlocState.countryModal!.entity.length < 22 ? appControllerBlocState.countryModal?.entity ?? '' : '${appControllerBlocState.countryModal?.entity.substring(0, 21)}...' : ''} |  ${appControllerBlocState.countryModal!.isCurrencySupported ? "${appControllerBlocState.countryModal!.currencyCode}(${getCurrencySymbol(appControllerBlocState.countryModal!.currencyCode)})" : "USD(${getCurrencySymbol("USD")})"}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Checkout Default Currency",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                                color: AppColors
                                                    .primaryActiveColor),
                                      ),
                                      Tooltip(
                                          message: "The country",
                                          triggerMode: TooltipTriggerMode.tap,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            width: 24.w,
                                            child: Icon(
                                              Icons.info_outline_rounded,
                                              size: 14.r,
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Form(
                                    key: formKey['currencyKey'],
                                    child: Container(
                                        height: 45.h,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.appGreyColor,
                                              width: .5),
                                        ),
                                        // padding: EdgeInsets.symmetric(
                                        //     horizontal: 18.w),
                                        width: double.maxFinite,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField<
                                              CurrencyAndSymbol>(
                                            focusNode: nodes['currencyKey'],
                                            icon: Center(
                                                child: Icon(
                                              Icons.keyboard_arrow_down,
                                              size: 32.sp,
                                            )),
                                            hint:
                                                const Text("Select a Currency"),
                                            value: selectedCurrencyAndSymbol,
                                            isDense: true,
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectedCurrencyAndSymbol =
                                                    newValue;
                                              });
                                            },
                                            items: appControllerBlocState
                                                .currencyList
                                                .map((currency) {
                                              return DropdownMenuItem<
                                                  CurrencyAndSymbol>(
                                                value: currency,
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "${currency.currencyCode}(${currency.currencySymbol})",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Last Logged",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            ?.copyWith(
                                                color: AppColors
                                                    .primaryActiveColor),
                                      ),
                                      Tooltip(
                                          message: "Last Logged",
                                          triggerMode: TooltipTriggerMode.tap,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            width: 24.w,
                                            child: Icon(
                                              Icons.info_outline_rounded,
                                              size: 14.r,
                                            ),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Container(
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.appGreyColor,
                                            width: .5)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.w),
                                    width: double.maxFinite,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(children: [
                                            if (state.userProfileModal !=
                                                    null &&
                                                state.userProfileModal
                                                        ?.lastLoggedIn !=
                                                    null)
                                              TextSpan(
                                                  text:
                                                      "${DateFormat('yyyy-MM-dd').format(state.userProfileModal!.lastLoggedIn!.toLocal())} ${DateFormat('HH:MM').format(state.userProfileModal!.lastLoggedIn!.toLocal())} ${state.userProfileModal!.lastLoggedIn!.toLocal().timeZoneName} (UTC${state.userProfileModal!.lastLoggedIn!.toLocal().timeZoneOffset.isNegative ? '-' : '+'}${state.userProfileModal!.lastLoggedIn!.toLocal().timeZoneOffset.inHours}:${state.userProfileModal!.lastLoggedIn!.toLocal().timeZoneOffset.inMinutes.remainder(60)}), "),
                                            if (state
                                                    .userProfileModal
                                                    ?.deviceInfoModal
                                                    ?.browser
                                                    ?.name !=
                                                null)
                                              TextSpan(
                                                  text:
                                                      '${state.userProfileModal!.deviceInfoModal!.browser!.name}${state.userProfileModal!.deviceInfoModal!.browser!.name.isNotEmpty ? ', ' : ''}'),
                                            if (state
                                                    .userProfileModal
                                                    ?.deviceInfoModal
                                                    ?.os
                                                    ?.name !=
                                                null)
                                              TextSpan(
                                                  text:
                                                      '${state.userProfileModal?.deviceInfoModal?.os?.name}${state.userProfileModal!.deviceInfoModal!.os!.name.isNotEmpty ? ', ' : ''}'),
                                            TextSpan(
                                                text: state.userProfileModal
                                                        ?.addressCountry ??
                                                    '')
                                          ]),
                                          textAlign: TextAlign.start,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),

                              //Invalid inputs are not allowed. Profile image, Country, Default currency, Date of Birth& Phone only allowed
                              AppButton2(
                                isLoading: state.isLoading,
                                filled: true,
                                onTap: () async {
                                  for (var element in formKey.entries) {
                                    if (element.value.currentState != null) {
                                      if (!element.value.currentState!
                                          .validate()) {
                                        scrollController.jumpTo(scrollController
                                            .position.minScrollExtent);
                                        nodes[element.key]?.requestFocus();

                                        return;
                                      }
                                    }
                                  }

                                  final dataMap = {
                                    'firstName':
                                        firstNameController.text.trim(),
                                    'lastName': lastNameController.text.trim(),
                                    'profileImage': selectedImage != null
                                        ? MultipartFile.fromFileSync(
                                            selectedImage!.path,
                                            filename:
                                                selectedImage?.path.toString(),
                                            contentType:
                                                MediaType('image', 'png'))
                                        : '',
                                    'country': selectedCountry?.entity,
                                    'selectedCountry': appControllerBlocState
                                        .countryModal?.countryCode,
                                    'checkoutDefaultCurrency':
                                        selectedCurrencyAndSymbol?.currencyCode,
                                  };
                                  if (selectedDate != null) {
                                    dataMap.addAll({
                                      'dob': DateFormat('yyyy-MM-dd')
                                          .format(selectedDate!),
                                    });
                                  }
                                  if (phoneNumber != null) {
                                    dataMap.addAll({
                                      'number': phoneNumber?.number
                                          .replaceAll(RegExp(r"\D"), ''),
                                      'numericCode': phoneNumber?.countryCode,
                                      'countryCode': countryCodesConvertA2ToA3(
                                        a2Code: phoneNumber!.countryISOCode,
                                      ),
                                    });
                                  }
                                  BlocProvider.of<UserProfileBloc>(context).add(
                                      UserProfileEvent.saveMyProfile(
                                          data: dataMap,
                                          country: selectedCountry));
                                },
                                text: Text(
                                  "Save",
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                feedbackTimeText: Text(
                                  "Save",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                          color: AppColors.primaryActiveColor),
                                ),
                              ),

                              SizedBox(
                                height: 30.h,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<XFile?> _selectImage(BuildContext context) async {
    final img = await ImageUtils.getImage(context);
    if (img == null) {
      return null;
    }
    final image = img as XFile;
    final size = await image.length();
    if (size > 2097152) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image must be less than 2MB')));
        return null;
      }
    }

    if (image.name.endsWith('.jpg') ||
        image.name.endsWith('.jpeg') ||
        image.name.endsWith('.png')) {
      return image;
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Image must be in jpg/jpeg/png format')));
      }
      return null;
    }
  }

  void mapAndInitCountry(
      AppControllerState appControllerBlocState, UserProfileState state) {
    if (appControllerBlocState.countries.isNotEmpty) {
      selectedCountry = appControllerBlocState.countries.firstWhere((element) {
        return element.countryCode ==
            state.userProfileModal?.user.country.details.countryCode;
      },
          orElse: () => appControllerBlocState.countries.firstWhere((element) =>
              element.countryCode ==
              appControllerBlocState.countryModal?.countryCode));
    }

    selectedCurrencyAndSymbol =
        appControllerBlocState.currencyList.firstWhereOrNull(
      (element) {
        return element.currencyCode ==
            state.userProfileModal?.checkoutDefaultCurrency;
      },
    );
  }

  _showDatePicker(BuildContext context, DateTime? currentDate) {
    if (Platform.isIOS) {
      _showCupertinoDatePicker(
          CupertinoDatePicker(
            minimumDate: DateTime(
              1970,
            ),
            maximumDate: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            initialDateTime: DateTime.now(),
            use24hFormat: true,
            // This is called when the user changes the dateTime.
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                selectedDate = newDateTime;
              });
            },
          ),
          context);
      return;
    }
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        1970,
      ),
      lastDate: DateTime(
          DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
    ).then((newDateTime) => newDateTime != null
        ? setState(() => selectedDate = newDateTime)
        : null);
  }

  void _showCupertinoDatePicker(Widget child, BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}

class ImagePlaceHolder extends StatelessWidget {
  const ImagePlaceHolder({
    Key? key,
    this.image,
    this.existingImage,
  }) : super(key: key);

  final XFile? image;
  final String? existingImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          color: existingImage != null || image != null
              ? AppColors.appWhite
              : AppColors.appGreyColor,
          dashPattern: const [5, 5],
          radius: Radius.circular(50.r),
          borderType: BorderType.Circle,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
                  image != null ? FileImage(File(image!.path)) : null,
              foregroundImage: existingImage != null
                  ? existingImage!.isNotEmpty
                      ? NetworkImage(existingImage!)
                      : null
                  : null,
              radius: 50.r,
              child: image == null
                  ? Center(
                      child: SvgPicture.asset(
                      SvgAssets.cameraIcon,
                      fit: BoxFit.contain,
                      width: 42.w,
                      height: 37.h,
                    ))
                  : const SizedBox(),
            ),
          ),
        ),
        if (image != null)
          Positioned(
              right: 5,
              bottom: 5,
              child: CircleAvatar(
                backgroundColor: AppColors.appGreyColor,
                radius: 11.r,
                child: CircleAvatar(
                  backgroundColor: AppColors.appWhite,
                  radius: 10.r,
                  child: SizedBox(
                    width: 10.w,
                    height: 10.w,
                    child: SvgPicture.asset(SvgAssets.cameraIcon),
                  ),
                ),
              )),
        if (existingImage != null)
          Positioned(
              right: 5,
              bottom: 5,
              child: CircleAvatar(
                backgroundColor: AppColors.appGreyColor,
                radius: 11.r,
                child: CircleAvatar(
                  backgroundColor: AppColors.appWhite,
                  radius: 10.r,
                  child: SizedBox(
                    width: 10.w,
                    height: 10.w,
                    child: SvgPicture.asset(SvgAssets.cameraIcon),
                  ),
                ),
              )),
      ],
    );
  }
}
