import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/forgot_password/repository/repository.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class ScreenEnterOtp extends StatefulWidget {
  const ScreenEnterOtp({super.key});

  @override
  State<ScreenEnterOtp> createState() => _ScreenEnterOtpState();
}

class _ScreenEnterOtpState extends State<ScreenEnterOtp> {
  final repository = getIt<ForgotPasswordRepository>();

  late String email;
  NumberFormat numberFormat = NumberFormat("00");

  String code = '';
  bool allowOtp = false;

  Future<void> _resendOtp(BuildContext context, {bool? checkout}) async {
    otpFieldController.clear();
    setState(() {
      allowOtp = false;
    });
    final res = await repository.resendOtp(email);
    res.fold((l) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to resend otp')));
    }, (r) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Otp was sent, please chek your email')));
    });
    myDuration = const Duration(seconds: 120);
    startTimer();
  }

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 120);

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

  OtpFieldController otpFieldController = OtpFieldController();
  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    countdownTimer?.cancel();
    print("dispose");
    super.dispose();
  }

  @override
  void deactivate() {
    print("deactivate");
    // TODO: implement deactivate
    super.deactivate();
  }

  late OtpVerificationArguments args;
  bool firstBuild = true;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    args =
        ModalRoute.of(context)?.settings.arguments as OtpVerificationArguments;
    email = args.string;
    if (firstBuild) {
      if (args.prevPage == Routes.checkoutScreen ||
          args.prevPage == Routes.screenSettings) {}
      firstBuild = false;
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: buildAppAppBar(() {
          Navigator.pop(context);
        }),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 260.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImageAssets.otp_page_image),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Verify your email.",
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        Text.rich(
                          TextSpan(children: <InlineSpan>[
                            TextSpan(
                                text:
                                    "Please enter the six-digit code we have sent you at",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: AppColors.appGreyColor)),
                            TextSpan(
                              text: ' $email',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            // TextSpan(
                            //     text: ' Six boxes below it',
                            //     style: Theme.of(context)
                            //         .textTheme
                            //         .bodyText1
                            //         ?.copyWith(color: AppColors.appGreyColor)),
                          ]),
                          textAlign: TextAlign.left,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    // OtpTextField(
                    //   fieldWidth: 47.w,
                    //   clearText: true,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   textStyle: Theme.of(context)
                    //       .textTheme
                    //       .headline3
                    //       ?.copyWith(fontSize: 36),
                    //   borderWidth: 1,
                    //   numberOfFields: 6,
                    //   borderColor: AppColors.primaryActiveColor,
                    //   showFieldAsBox: true,
                    //   onCodeChanged: (String code) {
                    //     code = code;
                    //   },
                    //   borderRadius: BorderRadius.zero,
                    //   showCursor: true,
                    //
                    //   enabledBorderColor: AppColors.lightGrey,
                    //   focusedBorderColor: AppColors.primaryActiveColor,
                    //
                    //   onSubmit: (String verificationCode) async {
                    //
                    //   }, // end onSubmit
                    // ),
                    OTPTextField(
                      hasError: hasError,
                      onChanged: (code) {
                        setState(() {
                          hasError = false;
                          code = code;
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
                      ),
                      onCompleted: (pin) {
                        showCupertinoModalPopup(
                            semanticsDismissible: false,
                            context: context,
                            builder: (ctx) {
                              onSubmit(pin, context, ctx);

                              return const Center(
                                  child: CupertinoActivityIndicator());
                            });
                      },
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    hasError
                        ? Text(
                            "Invalid code. Get a new code via email with Click to Resend and then re-enter it here",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: AppColors.cherryRed),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${myDuration.inSeconds == 120 || myDuration.inSeconds == 0 ? 'You can request new code ' : 'You can request new code in:'} ",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: AppColors.appGreyColor),
                        ),
                        Text(
                          myDuration.inSeconds == 120 ||
                                  myDuration.inSeconds == 0
                              ? 'now'
                              : " ${numberFormat.format(myDuration.inMinutes.remainder(60))}:${(numberFormat.format(myDuration.inSeconds.remainder(60)))}",
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    color: AppColors.cherryRed,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppButton(
                      filled: true,
                      onTap: () {
                        if (code.isEmpty) {
                          return;
                        }
                        showCupertinoModalPopup(
                            semanticsDismissible: false,
                            context: context,
                            builder: (ctx) {
                              onSubmit(code, context, ctx);

                              return const Center(
                                  child: CupertinoActivityIndicator());
                            });
                      },
                      text: Text(
                        ButtonStrings.verify,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      feedbackTimeText: Text(
                        ButtonStrings.verify,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),

                    GestureDetector(
                      onTap: () {
                        if (allowOtp) {
                          _resendOtp(context,
                              checkout: args.prevPage == Routes.checkoutScreen);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Wait to ${myDuration.inMinutes.remainder(60)}:${(myDuration.inSeconds.remainder(60))} resend')));
                        }
                      },
                      child: Text.rich(
                        TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AppColors.appGreyColor),
                          text: "Didn't get a code? ",
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Click to Resend',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.primaryActiveColor),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void onSubmit(String verificationCode, BuildContext context,
      BuildContext popUpCtx) async {
    final resp = await repository.submitOtpAndGetToken(email, verificationCode);
    resp.fold(
      (failure) {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text(failure.message),
        // ));
        setState(() {
          hasError = true;
        });
        Navigator.pop(popUpCtx);
      },
      (token) {
        Navigator.pop(popUpCtx);
        Navigator.pushNamed(
          context,
          Routes.changePasswordScreen,
          arguments: token,
        );
      },
    );
  }
}
