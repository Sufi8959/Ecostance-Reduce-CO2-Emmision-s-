import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/register/repository/repository.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

enum VerifyStatusEum { AUTHENTICATED, VERIFIED }

class ScreenRegistrationEnterOtp extends StatefulWidget {
  const ScreenRegistrationEnterOtp({super.key});

  @override
  State<ScreenRegistrationEnterOtp> createState() =>
      _ScreenRegistrationEnterOtpState();
}

class _ScreenRegistrationEnterOtpState
    extends State<ScreenRegistrationEnterOtp> {
  final repository = getIt<RegisterRepository>();
  static const int TIME_DELAY = 300;
  late String email;
  NumberFormat numberFormat = NumberFormat("00");

  String code = '';
  // bool allowOtp = false;

  Future<void> _resendOtp(BuildContext context, {bool? checkout}) async {
    if (otpSending) {
      return;
    }
    otpFieldController.clear();
    setState(() {
      otpSending = true;
    });
    final res = await repository.resendOtp(email, checkout: checkout);
    res.fold((l) {
      setState(() {
        otpSending = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to resend otp')));
    }, (r) {
      stopTimer();
      myDuration = const Duration(seconds: TIME_DELAY);
      startTimer();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Otp was sent, please chek your email')));
      setState(() {
        otpSending = false;
      });
    });
  }

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: TIME_DELAY);

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
        // setState(() {
        //   allowOtp = true;
        // });
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

  String title = 'Verify your email';
  String _getTitle(String route) {
    switch (args.prevPage) {
      case Routes.checkoutScreen:
        return "Verify your email to checkout.";
      case Routes.screenSettings:
        return "Verify your email for newsletter subscription";
      case Routes.registerRoute:
        return "Verify your email to complete registration and login.";

      case Routes.loginRoute:
        return "Verify your email to complete registration and login.";

      default:
        return "Verify your email to complete registration and login.";
    }
  }

  Widget message = const Text(
    "Help us secure your account by verifying your email",
  );
  Widget _getMessage(String route, String email) {
    String m1 = "Help us secure your account by verifying that";
    String m2 =
        ' is your email. Please enter the six-digit code we sent you to verify your email.';

    switch (args.prevPage) {
      case Routes.checkoutScreen:
        m1 = "Please enter the six-digit code we have sent you at";
        break;
      case Routes.screenSettings:
        m1 = 'Please enter the six-digit code we have sent you at';
        m2 = ' Six boxes below it';
        break;
      case Routes.registerRoute:
        break;
      case Routes.loginRoute:
        break;
      default:
        m1 = "Help us secure your account by verifying that";
        m2 =
            'is your email. Please enter the six-digit code we sent you to verify your email.';
    }

    return Text.rich(
      TextSpan(children: <InlineSpan>[
        TextSpan(
            text: m1,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.appGreyColor)),
        TextSpan(
          text: ' $email',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        route == Routes.checkoutScreen
            ? const TextSpan()
            : TextSpan(
                text: m2,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.appGreyColor)),
      ]),
      textAlign: TextAlign.left,
    );
  }

  bool isLoading = false;
  bool otpSending = false;
  @override
  Widget build(BuildContext context) {
    args =
        ModalRoute.of(context)?.settings.arguments as OtpVerificationArguments;

    if (firstBuild) {
      email = args.string;
      title = _getTitle(args.prevPage);
      message = _getMessage(args.prevPage, args.string);
      if (args.prevPage == Routes.checkoutScreen ||
          args.prevPage == Routes.screenSettings) {
        repository.resendOtp(email,
            checkout: args.prevPage == Routes.checkoutScreen);
      }
      firstBuild = false;
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: buildAppAppBar(() {
          if (isLoading || args.prevPage == Routes.checkoutScreen) {
            return;
          }
          Navigator.pop(context, VerifyStatusEum.AUTHENTICATED);
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
                            fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 22.h,
                        ),
                        message
                        // Text.rich(
                        //   TextSpan(children: <InlineSpan>[
                        //     TextSpan(
                        //         text: args.prevPage == Routes.checkoutScreen
                        //             ? "Please enter the six-digit code we have sent you at"
                        //             : "Help us secure your account by verifying that",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodyText1
                        //             ?.copyWith(color: AppColors.appGreyColor)),
                        //     TextSpan(
                        //       text: ' $email ',
                        //       style: Theme.of(context).textTheme.subtitle1,
                        //     ),
                        //     args.prevPage == Routes.checkoutScreen
                        //         ? const TextSpan()
                        //         : TextSpan(
                        //             text:
                        //                 "is your email. Please enter the six-digit code we sent you to verify your email.",
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .bodyText1
                        //                 ?.copyWith(
                        //                     color: AppColors.appGreyColor)),
                        //   ]),
                        //   textAlign: TextAlign.left,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    OTPTextField(
                      hasError: hasError,
                      onChanged: (val) {
                        setState(() {
                          hasError = false;
                          code = val;
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
                        if (pin.isEmpty) {
                          return;
                        }
                        onSubmit(pin, context, args.string);
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
                    SizedBox(
                      height: 24.h,
                    ),
                    AppButton2(
                      isLoading: isLoading,
                      filled: true,
                      onTap: () {
                        if (code.isEmpty) {
                          return;
                        }
                        if (code.length < 6) {
                          return;
                        }
                        onSubmit(code, context, args.string);
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
                      height: 3.h,
                    ),
                    args.prevPage == Routes.checkoutScreen
                        ? SizedBox()
                        : TextButton(
                            onPressed: () {
                              if (isLoading) {
                                return;
                              }
                              Navigator.pop(
                                  context, VerifyStatusEum.AUTHENTICATED);
                            },
                            child: Text("I’ll verify later",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor,
                                        decoration: TextDecoration.underline,
                                        height: 1.5)),
                          ),
                    SizedBox(
                      height: 3.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (isLoading) {
                          return;
                        }
                        // if (allowOtp) {
                        _resendOtp(context,
                            checkout: args.prevPage == Routes.checkoutScreen);
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text(
                        //           'Wait ${myDuration.inMinutes.remainder(60)}:${(myDuration.inSeconds.remainder(60))} to resend')));
                        // }
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

  void onSubmit(
      String verificationCode, BuildContext context, String email) async {
    setState(() {
      isLoading = true;
    });
    final resp = await repository
        .verifyWithOtp(OtpVerifyRequest(email.toLowerCase(), verificationCode));

    resp.fold((l) {
      otpFieldController.clear();

      FocusManager.instance.primaryFocus?.unfocus();

      setState(() {
        code = '';
        isLoading = false;
        hasError = true;
      });
    }, (r) async {
      BlocProvider.of<AuthBloc>(context)
          .add(const AuthEvent.setVerified(verificationStatus: 'VERIFIED'));

      Navigator.pop(context, VerifyStatusEum.VERIFIED);
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}

//////////////////////////////////////////////////////////////////////

class OtpVerificationArguments {
  String string;
  String prevPage;
  OtpVerificationArguments(this.string, this.prevPage);
}
