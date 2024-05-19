// import 'dart:async';
// //ScreenRegistrationEnterOtp
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:net_carbons/app/auth/auth_bloc.dart';
// import 'package:net_carbons/app/constants/constants_classes.dart';
// import 'package:net_carbons/app/dependency.dart';
// import 'package:net_carbons/data/forgot_password/repository/repository.dart';
// import 'package:net_carbons/data/register/repository/repository.dart';
// import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
// import 'package:net_carbons/presentation/login/bloc/login_bloc.dart';
// import 'package:net_carbons/presentation/resources/assets.dart';
// import 'package:net_carbons/presentation/resources/color.dart';
// import 'package:net_carbons/presentation/resources/route_manager.dart';
// import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/otp_field_style.dart';
// import 'package:otp_text_field/style.dart';
//
// import '../../app/ui/responsive_size.dart';
// import '../resources/ui_widgets/top_wave_bar.dart';
//
// class ScreenRegistrationEnterOtp extends StatefulWidget {
//   ScreenRegistrationEnterOtp({super.key});
//
//   @override
//   State<ScreenRegistrationEnterOtp> createState() =>
//       _ScreenRegistrationEnterOtpState();
// }
//
// class _ScreenRegistrationEnterOtpState
//     extends State<ScreenRegistrationEnterOtp> {
//   final repository = getIt<RegisterRepository>();
//
//   late String email;
//   NumberFormat numberFormat = NumberFormat("00");
//
//   String code = '';
//   bool allowOtp = false;
//
//   Future<void> _resendOtp(BuildContext context) async {
//     otpFieldController.clear();
//     setState(() {
//       allowOtp = false;
//     });
//     final res = await repository.resendOtp(email);
//     res.fold((l) {
//       setState(() {
//         allowOtp = true;
//       });
//       print(l.message);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Failed to resend otp')));
//     }, (r) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Otp was sent, please chek youe email')));
//     });
//
//     myDuration = const Duration(seconds: 120);
//
//     startTimer();
//   }
//
//   Timer? countdownTimer;
//   Duration myDuration = Duration(seconds: 120);
//   void startTimer() {
//     countdownTimer =
//         Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
//   }
//
//   void stopTimer() {
//     setState(() => countdownTimer?.cancel());
//   }
//
//   void setCountDown() {
//     const reduceSecondsBy = 1;
//     setState(() {
//       final seconds = myDuration.inSeconds - reduceSecondsBy;
//       if (seconds < 0) {
//         setState(() {
//           allowOtp = true;
//         });
//         countdownTimer!.cancel();
//       } else {
//         myDuration = Duration(seconds: seconds);
//       }
//     });
//   }
//
//   OtpFieldController otpFieldController = OtpFieldController();
//   @override
//   void initState() {
//     startTimer();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     countdownTimer?.cancel();
//
//     super.dispose();
//   }
//
//   late OtpVerificationArguments args;
//   bool firstBuild = true;
//   @override
//   Widget build(BuildContext context) {
//     args =
//     ModalRoute.of(context)?.settings.arguments as OtpVerificationArguments;
//     email = args.string;
//     if (firstBuild) {
//       print("firstBuild");
//       if (args.prevPage == Routes.checkoutScreen) {
//         repository.resendOtp(email);
//       }
//
//       firstBuild = false;
//     }
//
//     return Scaffold(
//       appBar: buildAppAppBar(context),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 22.w),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Image.asset(ImageAssets.otp_page_image),
//                 SizedBox(
//                   height: 44.h,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Please check your email',
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2
//                           ?.copyWith(color: AppColors.primaryActiveColor),
//                     ),
//                     SizedBox(
//                       height: 6.h,
//                     ),
//                     Text.rich(
//                       TextSpan(children: <InlineSpan>[
//                         TextSpan(
//                             text: "We’ve sent a code to",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyText1
//                                 ?.copyWith(color: AppColors.appGreyColor)),
//                         TextSpan(
//                           text: ' $email',
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyText1
//                               ?.copyWith(fontWeight: FontWeight.w600),
//                         )
//                       ]),
//                       textAlign: TextAlign.center,
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 43.h,
//                 ),
//                 // OtpTextField(
//                 //   fieldWidth: 47.w,
//                 //   clearText: true,
//                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //   textStyle: Theme.of(context)
//                 //       .textTheme
//                 //       .headline3
//                 //       ?.copyWith(fontSize: 36),
//                 //   borderWidth: 1,
//                 //   numberOfFields: 6,
//                 //   borderColor: AppColors.primaryActiveColor,
//                 //   showFieldAsBox: true,
//                 //   onCodeChanged: (String code) {
//                 //     code = code;
//                 //   },
//                 //   borderRadius: BorderRadius.zero,
//                 //   showCursor: true,
//                 //
//                 //   enabledBorderColor: AppColors.lightGrey,
//                 //   focusedBorderColor: AppColors.primaryActiveColor,
//                 //
//                 //   onSubmit: (String verificationCode) async {
//                 //
//                 //   }, // end onSubmit
//                 // ),
//                 OTPTextField(
//                   onChanged: (code) {
//                     setState(() {
//                       code = code;
//                     });
//                   },
//                   controller: otpFieldController,
//                   outlineBorderRadius: 0,
//                   length: 6,
//                   width: MediaQuery.of(context).size.width,
//                   fieldWidth: 47.w,
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline1!
//                       .copyWith(fontSize: 36.sp),
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldStyle: FieldStyle.box,
//                   otpFieldStyle: OtpFieldStyle(
//                     borderColor: AppColors.primaryActiveColor,
//                     enabledBorderColor: AppColors.lightGrey,
//                     focusBorderColor: AppColors.primaryActiveColor,
//                   ),
//                   onCompleted: (pin) {
//                     showCupertinoModalPopup(
//                         semanticsDismissible: false,
//                         context: context,
//                         builder: (ctx) {
//                           onSubmit(pin, context, ctx);
//
//                           return const Center(
//                               child: CupertinoActivityIndicator());
//                         });
//                   },
//                 ),
//                 SizedBox(
//                   height: 17.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       "${myDuration.inSeconds == 120 || myDuration.inSeconds == 0 ? 'You can request new code ' : 'You can request new code in:'} ",
//                       textAlign: TextAlign.center,
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText1
//                           ?.copyWith(color: AppColors.appGreyColor),
//                     ),
//                     Text(
//                       myDuration.inSeconds == 120 || myDuration.inSeconds == 0
//                           ? 'now'
//                           : " ${numberFormat.format(myDuration.inMinutes.remainder(60))}:${(numberFormat.format(myDuration.inSeconds.remainder(60)))}",
//                       style: Theme.of(context).textTheme.subtitle1?.copyWith(
//                         color: AppColors.cherryRed,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 49.h,
//                 ),
//                 AppOutlinedButton(
//                   filled: true,
//                   onTap: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Invalid Otp')));
//                   },
//                   text: Text(
//                     ButtonStrings.verify,
//                     style: Theme.of(context).textTheme.headline2,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 args.prevPage == Routes.checkoutScreen
//                     ? SizedBox()
//                     : TextButton(
//                   onPressed: () {
//                     ///TODO
//                     Navigator.pop(context, "AUTHENTICATED");
//                   },
//                   child: Text("Skip",
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline2
//                           ?.copyWith(
//                           color: AppColors.primaryActiveColor,
//                           decoration: TextDecoration.underline,
//                           height: 1.5)),
//                 ),
//
//                 SizedBox(
//                   height: 18.h,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (allowOtp) {
//                       _resendOtp(context);
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text(
//                               'Wait to ${myDuration.inMinutes.remainder(60)}:${(myDuration.inSeconds.remainder(60))} resend')));
//                     }
//                   },
//                   child: Text.rich(
//                     TextSpan(
//                       style: Theme.of(context).textTheme.caption,
//                       text: "Didn't get a code? ",
//                       children: <InlineSpan>[
//                         TextSpan(
//                           text: 'Click to Resend',
//                           style: Theme.of(context)
//                               .textTheme
//                               .subtitle2
//                               ?.copyWith(decoration: TextDecoration.underline),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 1,
//                 )
//               ]),
//         ),
//       ),
//     );
//   }
//
//   void onSubmit(String verificationCode, BuildContext context,
//       BuildContext popUpCtx) async {
//     final resp = await repository
//         .verifyWithOtp(OtpVerifyRequest(email, verificationCode));
//
//     resp.fold((l) {
//       otpFieldController.clear();
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(l.message),
//       ));
//       Navigator.pop(popUpCtx);
//     }, (r) async {
//       print(r.token);
//       verifyToken(r.token, context);
//       Navigator.pop(popUpCtx);
//     });
//   }
//
//   Future verifyToken(String token, BuildContext context) async {
//     final result = await repository.verifyToken(token);
//     result.fold((l) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(l.message),
//       ));
//     }, (r) {
//       if (r.token.isNotEmpty) {
//         BlocProvider.of<LoginBloc>(context)
//             .add(LoginEvent.emailVerified(authDataModal: r));
//         if (args.prevPage == Routes.registerRoute ||
//             args.prevPage == Routes.loginRoute) {
//           Navigator.pop(context, 'VERIFIED');
//           //  Navigator.pushReplacementNamed(context, Routes.registrationThanks);
//         } else {
//           Navigator.pop(context, 'VERIFIED');
//         }
//       }
//     });
//   }
// }
//
// class OtpVerificationArguments {
//   String string;
//   String prevPage;
//   OtpVerificationArguments(this.string, this.prevPage);
// }
