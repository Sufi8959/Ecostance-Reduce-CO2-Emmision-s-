import 'dart:async';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/core/general/failiure.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/app_widgets/text_input_field.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/profile/child_screens/change_email/change_email.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class ChangeEmailVerificationStepper extends StatefulWidget {
  const ChangeEmailVerificationStepper(
      {Key? key, required this.changeEmailOpData})
      : super(key: key);
  final ChangeEmailOpData changeEmailOpData;

  @override
  State<ChangeEmailVerificationStepper> createState() =>
      _ChangeEmailVerificationStepperState();
}

class _ChangeEmailVerificationStepperState
    extends State<ChangeEmailVerificationStepper> {
  final repository = getIt<UserProfileRepository>();

  final _stepperNotifier = ValueNotifier<int>(0);
  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    // TODO: implement initState
    super.initState();
    // if (widget.changeEmailOpData.changeEmailType == ChangeEmailType.primary) {
    //   _initEmailOtpPRIMARY();
    // } else {
    //   _initEmailOtpRECOVERY();
    // }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  _initEmailOtpRECOVERY() async {
    setState(() {
      isLoading = true;
    });
    final res = await _sendEmailOtpRECOVERY();
    res.fold((l) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(
            context,
            widget.changeEmailOpData.changeEmailType == ChangeEmailType.primary
                ? ChangeEmailStatus.failed
                : ChangeRecoveryEmailStatus.failed);
      }
    }, (r) {
      setState(() {
        isLoading = false;
      });
    });
  }

  _verifyOtpRECOVERY(String otp) async {
    setState(() => isLoading = true);
    final res = await repository.verifyRecoveryEmailOtp(otp);
    res.fold((l) {
      setState(() {
        isLoading = false;
        otpHasError = true;
      });
    }, (r) {
      setState(() {
        isLoading = false;
      });
      BlocProvider.of<UserProfileBloc>(context)
          .add(const UserProfileEvent.fetchProfile());
      Navigator.pop(
          context,
          widget.changeEmailOpData.changeEmailType == ChangeEmailType.primary
              ? ChangeEmailStatus.success
              : ChangeRecoveryEmailStatus.success);
    });
  }

  Future<dartz.Either<Failure, dynamic>> _sendEmailOtpRECOVERY() {
    return repository.updateRecoveryEmail(widget.changeEmailOpData.newEmail);
  }

  OtpFieldController otpFieldController = OtpFieldController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  FocusNode passwordFocus = FocusNode();

  int currentStep = 0;
  bool isLoading = false;
  String otp = '';
  bool otpHasError = false;
  String aquiredTokenForVerifyEmail = '';
  bool verifyWithPasswordPRIMARYAttemptExceeded = false;
  int failedPrimaryEmailAttempts = 0;
////
  NumberFormat numberFormat = NumberFormat("00");
  static const int TIME_DELAY = 300;
  Timer? countdownTimer;
  bool allowOtp = false;
  Duration myDuration = Duration(seconds: TIME_DELAY);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer?.cancel());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        setState(() {
          allowOtp = true;
        });
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  ///
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: const CupertinoActivityIndicator(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                  Image.asset(
                    ImageAssets.otp_page_image,
                    fit: BoxFit.cover,
                    height: 230.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Step ${_stepperNotifier.value + 1}/2",
                          style: textTheme.bodyText1?.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 19.w),
                    child: ValueListenableBuilder<int>(
                        valueListenable: _stepperNotifier,
                        builder: (_, val, child) {
                          return Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: val == 0
                                          ? AppColors.blueFab
                                          : AppColors.orderPageGrayBg),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      color: val == 1
                                          ? AppColors.blueFab
                                          : AppColors.orderPageGrayBg),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: _stepperNotifier,
                    builder: (_, value, child) {
                      if (value == 1) {
                        countdownTimer?.cancel();
                      }
                      return returnView(index: value, textTheme: textTheme);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget returnView({required int index, required TextTheme textTheme}) {
    return index == 0
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Verify your new Primary email for login",
                      style: textTheme.headline1
                          ?.copyWith(fontWeight: FontWeight.w300)),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                      "Please enter the six-digit code we have sent you at ${widget.changeEmailOpData.newEmail}",
                      style: textTheme.bodyText1),
                  SizedBox(
                    height: 20.h,
                  ),
                  OTPTextField(
                    hasError: otpHasError,
                    onChanged: (code) {
                      setState(() {
                        otpHasError = false;
                        otp = code;
                      });
                    },
                    controller: otpFieldController,
                    outlineBorderRadius: 0,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 47.w,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 36.sp),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                      borderColor: AppColors.primaryActiveColor,
                      enabledBorderColor: AppColors.lightGrey,
                      focusBorderColor: AppColors.primaryActiveColor,
                      errorBorderColor: AppColors.redAccent,
                    ),
                    onCompleted: (pin) {
                      if (widget.changeEmailOpData.changeEmailType ==
                          ChangeEmailType.primary) {
                        _verifyOtpPRIMARY(pin);
                      } else {
                        _verifyOtpRECOVERY(pin);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   "${myDuration.inSeconds == TIME_DELAY || myDuration.inSeconds == 0 ? 'You can request new code ' : 'You can request new code in:'} ",
                      //   textAlign: TextAlign.center,
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .subtitle2
                      //       ?.copyWith(color: AppColors.appGreyColor),
                      // ),
                      Flexible(
                        child: Text(
                          myDuration.inSeconds == 0
                              ? 'Pleas request for a new code'
                              : 'Please enter the code within this time:',
                          //  myDuration.inSeconds < 1 ? "Please enter the code within this time:": "Pleas request for a new code",myDuration.inSeconds == TIME_DELAY ||
                          textAlign: TextAlign.start,
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  color: AppColors.appGreyColor,
                                  fontSize: 14.sp),
                        ),
                      ),
                      // Text(
                      //   myDuration.inSeconds == TIME_DELAY ||
                      //           myDuration.inSeconds == 0
                      //       ? 'now'
                      //       : " ${numberFormat.format(myDuration.inMinutes.remainder(60))}:${(numberFormat.format(myDuration.inSeconds.remainder(60)))}",
                      //   style:
                      //       Theme.of(context).textTheme.subtitle1?.copyWith(
                      //             color: AppColors.cherryRed,
                      //           ),
                      //   textAlign: TextAlign.center,
                      // ),

                      myDuration.inSeconds == 0
                          ? SizedBox()
                          : Text(
                              "${numberFormat.format(myDuration.inMinutes.remainder(60))}:${(numberFormat.format(myDuration.inSeconds.remainder(60)))}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    color: AppColors.cherryRed,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                    ],
                  ),
                  if (otpHasError)
                    Text(
                      "Invalid code. Get a new code via email with Click to Resend and then re-enter it here",
                      style: textTheme.bodyText1
                          ?.copyWith(color: AppColors.redAccent),
                    ),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppButton2(
                      isLoading: isLoading,
                      filled: true,
                      onTap: () {
                        if (widget.changeEmailOpData.changeEmailType ==
                            ChangeEmailType.primary) {
                          _verifyOtpPRIMARY(otp);
                        } else {
                          _verifyOtpRECOVERY(otp);
                        }
                      },
                      text: Text(
                        "Verify",
                        style: textTheme.headline2
                            ?.copyWith(color: AppColors.appWhite),
                      ),
                      feedbackTimeText: Text(
                        "Verify",
                        style: textTheme.headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      )),
                  SizedBox(
                    height: 12.h,
                  ),
                  AppButton(
                      filled: false,
                      onTap: () {},
                      text: Text(
                        "I'll verify later",
                        style: textTheme.headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                      feedbackTimeText: Text(
                        "I'll verify later",
                        style: textTheme.headline2
                            ?.copyWith(color: AppColors.appWhite),
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.changeEmailOpData.changeEmailType ==
                          ChangeEmailType.primary) {
                        _initEmailOtpPRIMARY();
                      } else {
                        _initEmailOtpRECOVERY();
                      }
                    },
                    child: SizedBox(
                        height: 25.h,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Didn't get a code?",
                                style: textTheme.subtitle1),
                            TextSpan(
                                text: "Click to Resend",
                                style: textTheme.subtitle1?.copyWith(
                                    decoration: TextDecoration.underline))
                          ]),
                        )),
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              children: [
                Text(
                  "Enter Password to change your Primary email",
                  style: textTheme.headline1
                      ?.copyWith(fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  "Help us secure your account by entering your current password.",
                  style: textTheme.bodyText1,
                ),
                SizedBox(
                  height: 24.h,
                ),
                InputField(
                  // fieldKey: _passwordFieldKey,
                  enabled:
                      !verifyWithPasswordPRIMARYAttemptExceeded, // failedPrimaryEmailAttempts>4 ?false:true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(' '))
                  ],
                  errorText: 'Enter Valid Password',
                  label: "Password *",
                  suffixIcon: Icons.remove_red_eye,
                  textEditingController: _passwordEditingController,
                  obscureText: true,
                  inputType: TextInputType.text,
                  hintText: "Password",
                  validator: (val) {
                    if (val!.isEmpty ||
                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$')
                            .hasMatch(val)) {
                      return 'Enter Valid Password';
                    }

                    return null;
                  },
                  focusNode: passwordFocus,

                  onFocused: () {}, onUnfocused: () {},
                ),
                SizedBox(
                  height: 14.h,
                ),
                AppButton2(
                    isLoading: isLoading,
                    filled: true,
                    filledColor: failedPrimaryEmailAttempts >= 4
                        ? AppColors.appGreyColor
                        : AppColors.primaryActiveColor,
                    onTap: () {
                      if (failedPrimaryEmailAttempts > 4) {
                        return;
                      }
                      _verifyWithPasswordPRIMARY(
                          _passwordEditingController.text.trim());
                    },
                    text: Text(
                      "Done",
                      style: textTheme.headline2
                          ?.copyWith(color: AppColors.appWhite),
                    ),
                    feedbackTimeText: Text(
                      "Done",
                      style: textTheme.headline2
                          ?.copyWith(color: AppColors.primaryActiveColor),
                    )),
                SizedBox(
                  height: 14.h,
                ),
                AppButton(
                    filled: false,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: Text(
                      "Cancel",
                      style: textTheme.headline2
                          ?.copyWith(color: AppColors.primaryActiveColor),
                    ),
                    feedbackTimeText: Text(
                      "Cancel",
                      style: textTheme.headline2
                          ?.copyWith(color: AppColors.appWhite),
                    )),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  child: SizedBox(
                      height: 25.h,
                      child: Text(
                        "Forgot Password?",
                        style: textTheme.subtitle2,
                      )),
                )
              ],
            ),
          );
  }

  _initEmailOtpPRIMARY() async {
    setState(() {
      isLoading = true;
    });
    final res = await _sendEmailOtpPRIMARY();
    res.fold((l) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(
            context,
            widget.changeEmailOpData.changeEmailType == ChangeEmailType.primary
                ? ChangeEmailStatus.failed
                : ChangeRecoveryEmailStatus.failed);
      }
    }, (r) {
      setState(() {
        isLoading = false;
      });
    });
  }

  _verifyOtpPRIMARY(String otp) async {
    setState(() => isLoading = true);
    final res = await repository.verifyPrimaryEmailOtp(otp);
    res.fold((l) {
      setState(() {
        isLoading = false;
        otpHasError = true;
      });
    }, (r) {
      aquiredTokenForVerifyEmail = r;
      _stepperNotifier.value = 1;
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<dartz.Either<Failure, dynamic>> _sendEmailOtpPRIMARY() {
    return repository.updatePrimaryEmail(widget.changeEmailOpData.newEmail);
  }

  _verifyWithPasswordPRIMARY(String password) async {
    if (verifyWithPasswordPRIMARYAttemptExceeded) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: getAttemtBasedMessage(4)));
      return;
    }
    setState(() => isLoading = true);
    final res = await repository.verifyPrimaryEmailUsingPassword(
        password, aquiredTokenForVerifyEmail);
    res.fold((l) {
      if (l is PrimaryEmalAtemptsExceeded) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: getAttemtBasedMessage(4)));

        setState(() {
          verifyWithPasswordPRIMARYAttemptExceeded = true;
          isLoading = false;
        });
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: getAttemtBasedMessage(failedPrimaryEmailAttempts)));
      failedPrimaryEmailAttempts += 1;
      setState(() => isLoading = false);
    }, (r) {
      setState(() => isLoading = false);
      BlocProvider.of<UserProfileBloc>(context)
          .add(const UserProfileEvent.fetchProfile());
      if (mounted) {
        Navigator.pop(
            context,
            widget.changeEmailOpData.changeEmailType == ChangeEmailType.primary
                ? ChangeEmailStatus.success
                : ChangeRecoveryEmailStatus.success);
      }
    });
  }

  Widget getAttemtBasedMessage(int val) {
    if (val == 2) {
      return RichText(
        text: const TextSpan(children: [
          TextSpan(text: "Wrong password \n"),
          TextSpan(text: "Your account will be locked after "),
          TextSpan(
              text: "2 ",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  "more unsuccessful attempt(s). Please reset your password by clicking “Forgot Password”"),
        ]),
      );
    } else if (val == 3) {
      return RichText(
        text: const TextSpan(children: [
          TextSpan(text: "Wrong password \n"),
          TextSpan(text: "Your account will be locked after "),
          TextSpan(
              text: "1 ",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  "more unsuccessful attempt(s). Please reset your password by clicking “Forgot Password”"),
        ]),
      );
    } else if (val >= 4) {
      return RichText(
        text: const TextSpan(children: [
          TextSpan(text: "Your account is locked due to"),
          TextSpan(
              text: "4 ",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  "unsuccessful attempt(s). Please reset your password by clicking “Forgot Password”"),
        ]),
      );
    }
    return const Text("Wrong password");
  }
}
