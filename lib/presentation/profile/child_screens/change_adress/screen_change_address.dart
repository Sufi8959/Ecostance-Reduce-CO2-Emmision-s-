import 'dart:async';

import 'package:country_codes/country_codes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/constants/a2_a3.dart';
import 'package:net_carbons/app/constants/a3_a2.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/all_countries/city_response/city.dart';
import 'package:net_carbons/data/all_countries/repository/repository.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/presentation/app_widgets/csPicker/modals/country_state.dart';
import 'package:net_carbons/presentation/app_widgets/csPicker/stat-country.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/app_widgets/text_input_field.dart';
import 'package:net_carbons/presentation/checkout/checkout_views/address_page_view.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class ScreenChangeAddress extends StatefulWidget {
  ScreenChangeAddress({super.key});

  @override
  State<ScreenChangeAddress> createState() => _ScreenChangeAddressState();
}

class _ScreenChangeAddressState extends State<ScreenChangeAddress> {
  bool loading = false;
  String initCountryCode = '';
  bool firstRun = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  final repository = getIt<CountriesRepository>();

  final UserProfileRepository userProfileRepository =
      getIt<UserProfileRepository>();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _addressLin1Controller = TextEditingController();

  final TextEditingController _addressLin2Controller = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _pinCodeController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  initFields(UserProfileModal? profileModal) {
    final billingAddress = profileModal?.billingAddress;
    _firstNameController.text = billingAddress?.firstName ?? '';
    _lastNameController.text = billingAddress?.lastName ?? '';
    _addressLin1Controller.text = billingAddress?.addressLine1 ?? '';
    _addressLin2Controller.text = billingAddress?.addressLine2 ?? '';
    _cityController.text = billingAddress?.city ?? '';
    _pinCodeController.text = billingAddress?.pincode ?? '';
    _emailController.text = profileModal?.user.email ?? '';
  }

  CountryPickerModel? selectedCountry;
  Region? selectedState;
  City? selectedCity;

  ScrollController scrollController = ScrollController();

  final Map<String, GlobalKey<FormState>> formKey = {
    "countryKey": GlobalKey<FormState>(),
    "stateKey": GlobalKey<FormState>(),
    "cityKey": GlobalKey<FormState>(),
    "address1Key": GlobalKey<FormState>(),
    "address2Key": GlobalKey<FormState>(),
    "zipKey": GlobalKey<FormState>(),
  };
  final Map<String, FocusNode> nodes = {
    "address1Key": FocusNode(),
    "address2Key": FocusNode(),
    "zipKey": FocusNode(),
    "countryKey": FocusNode(),
    "stateKey": FocusNode(),
    "cityKey": FocusNode(),
  };

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CupertinoActivityIndicator(),
      child: Scaffold(
        key: _scaffoldKey,
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
                      "Change address",
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
          child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              final billingAddress = state.userProfileModal?.billingAddress;
              firstRun ? initFields(state.userProfileModal) : null;
              firstRun = false;
              final locale = CountryCodes.getDeviceLocale();
              final CountryDetails details =
                  CountryCodes.detailsForLocale(locale);
              initCountryCode =
                  countryCodesConvertA2ToA3(a2Code: details.alpha2Code ?? '') ??
                      '';

              if (state.userProfileModal?.billingAddress?.countryCode != null) {
                if (state
                    .userProfileModal!.billingAddress!.countryCode.isNotEmpty) {
                  initCountryCode =
                      state.userProfileModal!.billingAddress!.countryCode;
                }
              }

              return Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      StateCountrySelector(
                        cityFocusNode: nodes['cityKey'],
                        cityFormKey: formKey['cityKey'],
                        countryFocusNode: nodes['countryKey'],
                        countryFormKey: formKey['countryKey'],
                        stateFocusNode: nodes['stateKey'],
                        stateFormKey: formKey['stateKey'],
                        initialCountryIso3Code: initCountryCode,
                        initialStateCode: billingAddress?.stateCode ?? '',
                        initialCity: billingAddress?.city ?? '',
                        onCountryChanged: (val) {
                          formKey['countryKey']?.currentState?.validate();
                          setState(() {
                            selectedCountry = val;
                          });
                        },
                        onStateChanged: (val) {
                          formKey['stateKey']?.currentState?.validate();
                          setState(() {
                            selectedState = val;
                          });
                        },
                        onCityChanged: (city) {
                          formKey['cityKey']?.currentState?.validate();
                          setState(() {
                            selectedCity = city;
                          });
                        },
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Form(
                        key: formKey['address1Key'],
                        child: InputField(
                          onChanged: (data) =>
                              formKey['address1Key']?.currentState?.validate(),
                          focusNode: nodes['address1Key'],
                          textEditingController: _addressLin1Controller,
                          label: 'Address Line 1',
                          hintText: 'Address',
                          validator: (val) {
                            if (val!.isEmpty || val.length < 8) {
                              return 'Enter a Valid address';
                            }
                            return null;
                          },
                          onFocused: () {},
                          onUnfocused: () {},
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Form(
                        key: formKey['address2Key'],
                        child: InputField(
                          onChanged: (data) =>
                              formKey['address2Key']?.currentState?.validate(),
                          focusNode: nodes['address2Key'],
                          textEditingController: _addressLin2Controller,
                          label: 'Address Line 2',
                          hintText: 'Address',
                          onFocused: () {},
                          onUnfocused: () {},
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Form(
                        key: formKey['zipKey'],
                        child: SizedBox(
                          width: 160.w,
                          child: InputField(
                            onChanged: (data) =>
                                formKey['zipKey']?.currentState?.validate(),
                            focusNode: nodes['zipKey'],
                            inputType: TextInputType.number,
                            textEditingController: _pinCodeController,
                            label: 'ZIP code/Pin code',
                            hintText: 'ZIP code/Pin code',
                            validator: (val) {
                              if (val!.isEmpty ||
                                  !RegExp(r"^[0-9]").hasMatch(val)) {
                                return 'Enter Code';
                              }
                              return null;
                            },
                            onFocused: () {},
                            onUnfocused: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppButton2(
                        height: 60.h,
                        onTap: () async {
                          for (var element in formKey.entries) {
                            if (!element.value.currentState!.validate()) {
                              scrollController.jumpTo(
                                  scrollController.position.minScrollExtent);
                              nodes[element.key]?.requestFocus();

                              return;
                            }
                          }

                          final billingAddressModal = BillingAddressModal(
                            firstName: _firstNameController.text,
                            lastName: _lastNameController.text,
                            addressLine1: _addressLin1Controller.text,
                            addressLine2: _addressLin2Controller.text,
                            city: selectedCity?.name ?? '',
                            state: selectedState?.name ?? '',
                            pincode: _pinCodeController.text,
                            countryCode: countryCodesConvertA2ToA3(
                                    a2Code: selectedCountry?.countryShortCode ??
                                        '') ??
                                '',
                            stateCode: selectedState?.shortCode ?? '',
                            country: selectedCountry?.countryName ?? '',

                            ////
                            customerProfile:
                                state.userProfileModal?.user.id ?? '',
                            id: state.userProfileModal?.billingAddress?.id ??
                                '',
                            email: _emailController.text.trim(),
                          );
                          submitForm(billingAddressModal, context);
                        },
                        filled: true,
                        text: Text(
                          ButtonStrings.continueText,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        feedbackTimeText: Text(
                          ButtonStrings.continueText,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool isLoading = false;

  Future<void> submitForm(
      BillingAddressModal billingAddressModal, BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    final res = await userProfileRepository.createOrUpdateAddress(
        billingAddressModal, null);
    res.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error in saving address")));
      setState(() {
        isLoading = false;
      });
    }, (r) {
      BlocProvider.of<UserProfileBloc>(context)
          .add(const UserProfileEvent.fetchProfile());

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Address Saved")));

      setState(() {
        isLoading = false;
      });
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }
}
