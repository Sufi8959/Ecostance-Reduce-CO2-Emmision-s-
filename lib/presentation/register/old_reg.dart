// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:net_carbons/app/auth/auth_bloc.dart';
// import 'package:net_carbons/app/dependency.dart';
// import 'package:net_carbons/data/login/repository/repository.dart';
// import 'package:net_carbons/data/register/repository/repository.dart';
// import 'package:net_carbons/presentation/login/bloc/login_bloc.dart';
// import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
// import 'package:net_carbons/presentation/resources/color.dart';
// import 'package:net_carbons/presentation/resources/route_manager.dart';
//
// import '../../app/constants/constants_classes.dart';
//
// import '../app_widgets/outlined_button.dart';
// import '../app_widgets/text_input_field.dart';
// import '../resources/ui_widgets/top_wave.dart';
//
// class ScreenRegister extends StatefulWidget {
//   const ScreenRegister({super.key});
//
//   @override
//   State<ScreenRegister> createState() => _ScreenRegisterState();
// }
//
// class _ScreenRegisterState extends State<ScreenRegister> {
//   final repository = getIt<RegisterRepository>();
//   final loginRepository = getIt<LoginRepository>();
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController _confirmPasswordEditingController =
//   TextEditingController();
//
//   final TextEditingController _passwordEditingController =
//   TextEditingController();
//
//   final TextEditingController _emailEditingController = TextEditingController();
//
//   bool termAndCondition = false;
//   bool newsLetter = false;
//
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     _passwordEditingController.addListener(() {
//       _checkPassword(_passwordEditingController.text.trim());
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
//       return Scaffold(
//         appBar: !isLoading ? buildAppAppBar(context) : null,
//         body: isLoading
//             ? const Center(child: CupertinoActivityIndicator())
//             : Container(
//           color: Colors.white,
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Text(
//                   "Registration",
//                   textAlign: TextAlign.left,
//                   style: Theme.of(context).textTheme.headline2?.copyWith(
//                       color: AppColors.primaryActiveColor, height: 1.222),
//                 ),
//                 SizedBox(
//                   height: 3.h,
//                 ),
//                 Text(
//                   "Create an profile and start saving nature.",
//                   style: Theme.of(context).textTheme.subtitle2,
//                 ),
//                 SizedBox(
//                   height: 32.h,
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         InputField(
//                           inputFormatters: [
//                             FilteringTextInputFormatter.deny(RegExp(' '))
//                           ],
//                           inputType: TextInputType.emailAddress,
//                           textEditingController: _emailEditingController,
//                           label: "Email",
//                           hintText: "Email",
//                           errorText: 'Enter a valid email',
//                           validator: (val) {
//                             if (val!.isEmpty ||
//                                 !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                     .hasMatch(val)) {
//                               return 'Enter Valid Email';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 26.h,
//                         ),
//                         InputField(
//                           inputFormatters: [
//                             FilteringTextInputFormatter.deny(RegExp(' '))
//                           ],
//                           errorText: 'Enter Valid Password',
//                           label: "Password",
//                           suffixIcon: Icons.remove_red_eye,
//                           textEditingController:
//                           _passwordEditingController,
//                           obscureText: true,
//                           inputType: TextInputType.text,
//                           hintText: "Password",
//                           validator: (val) {
//                             if (val!.isEmpty ||
//                                 !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$')
//                                     .hasMatch(val)) {
//                               return 'Enter Valid Password';
//                             }
//
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 26.h,
//                         ),
//                         InputField(
//                           inputFormatters: [
//                             FilteringTextInputFormatter.deny(RegExp(' '))
//                           ],
//                           label: "Confirm password",
//                           suffixIcon: Icons.remove_red_eye,
//                           textEditingController:
//                           _confirmPasswordEditingController,
//                           obscureText: true,
//                           inputType: TextInputType.text,
//                           hintText: "Confirm password",
//                           validator: (val) {
//                             if (_passwordEditingController.text.trim() !=
//                                 _confirmPasswordEditingController.text
//                                     .trim()) {
//                               return 'Password dose not match';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 9.h,
//                         ),
//                         Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: List.generate(
//                               4,
//                                   (index) => Expanded(
//                                 child: Container(
//                                   margin: EdgeInsets.only(left: 4.w),
//                                   width: 77.w,
//                                   height: 7.h,
//                                   decoration: BoxDecoration(
//                                       borderRadius:
//                                       BorderRadius.circular(3),
//                                       color: index < _strength
//                                           ? AppColors
//                                           .primaryActiveColor
//                                           : AppColors.lightGrey),
//                                 ),
//                               )),
//                         ),
//                         SizedBox(
//                           height: 18.h,
//                           child: Padding(
//                             padding: EdgeInsets.only(left: 6.w),
//                             child: Text(
//                               _strengthText,
//                               maxLines: 2,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 16.h,
//                         ),
//                         SignUpAgrementSwitch(
//                           title: "Terms and Conditions",
//                           subTitle: RichText(
//                             text: TextSpan(children: [
//                               TextSpan(
//                                   text: "I agree with ",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1),
//                               TextSpan(
//                                   text: "Terms & Conditions ",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1
//                                       ?.copyWith(
//                                       decoration:
//                                       TextDecoration.underline)),
//                               TextSpan(
//                                   text: "and ",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1),
//                               TextSpan(
//                                   text: "Privacy Policy",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodyText1
//                                       ?.copyWith(
//                                       decoration:
//                                       TextDecoration.underline))
//                             ]),
//                           ),
//                           value: termAndCondition,
//                           onChange: (newVal) {
//                             setState(() {
//                               termAndCondition = newVal;
//                             });
//                           },
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         SignUpAgrementSwitch(
//                           title: "Newsletter",
//                           subTitle: Text(
//                             "I want to receive any updates and newsletter on my email",
//                             style: Theme.of(context).textTheme.bodyText1,
//                           ),
//                           value: newsLetter,
//                           onChange: (newVal) {
//                             setState(() {
//                               newsLetter = newVal;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 35.h,
//                 ),
//                 AppOutlinedButton(
//                   onTap: () async {
//                     if (!_formKey.currentState!.validate()) {
//                       return;
//                     }
//                     if (!termAndCondition) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content: Text(
//                                   'Please accept terms and conditions')));
//                       return;
//                     }
//                     setState(() {
//                       isLoading = true;
//                     });
//                     final res = await repository.register(RegisterRequest(
//                       email: _emailEditingController.text.toLowerCase(),
//                       password: _passwordEditingController.text,
//                       confirmPassword: _passwordEditingController.text,
//                       newsLetter: newsLetter,
//                     ));
//
//                     res.fold((l) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text("Unable to register user"),
//                         ),
//                       );
//                       setState(() {
//                         isLoading = false;
//                       });
//                     }, (r) {
//                       BlocProvider.of<LoginBloc>(context).add(
//                           LoginEvent.loginButtonPressed(
//                               loginRequest: LoginRequest(
//                                   password:
//                                   _passwordEditingController.text,
//                                   userId: _emailEditingController.text
//                                       .toLowerCase(),
//                                   strategy: "password")));
//
//                       setState(() {
//                         isLoading = false;
//                       });
//                       Navigator.pushNamed(
//                           context, Routes.screenRegistrationEnterOtp,
//                           arguments: OtpVerificationArguments(
//                               _emailEditingController.text,
//                               Routes.registerRoute))
//                           .then((value) {
//                         Navigator.pop(context, value);
//                       });
//                     });
//                   },
//                   text: Text(
//                     ButtonStrings.signUp,
//                     style: Theme.of(context).textTheme.headline2,
//                   ),
//                   filled: true,
//                   height: 60.h,
//                 ),
//                 // SizedBox(
//                 //   height: 69.h,
//                 // )
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
//
//   double _strength = 0;
//   String _strengthText = 'Please enter a password';
//
//   RegExp numReg = RegExp(r".*[0-9].*");
//   RegExp upperCaseReg = RegExp(r".*[A-Z].*");
//   RegExp lowerCaseReg = RegExp(r".*[a-z].*");
//   RegExp regExp =
//   RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
//   void _checkPassword(String? value) {
//     if (value == null) {
//       return;
//     }
//     final password = value.trim();
//     if (password.isEmpty) {
//       setState(() {
//         _strength = 0;
//         _strengthText = 'Please enter a password';
//       });
//       return;
//     }
//     if (password.length >= 12 && regExp.hasMatch(password)) {
//       setState(() {
//         _strength = 4;
//         _strengthText = "Strong";
//       });
//       return;
//     }
//     if (password.length >= 8 && regExp.hasMatch(password)) {
//       setState(() {
//         _strength = 3;
//         _strengthText = "Good";
//       });
//       return;
//     }
//     if (password.length > 8 && !regExp.hasMatch(password)) {
//       setState(() {
//         _strength = 2;
//         _strengthText = "Weak";
//       });
//       return;
//     }
//     if (password.length < 8 || !regExp.hasMatch(password)) {
//       setState(() {
//         _strength = 1;
//         _strengthText = "Poor";
//       });
//       return;
//     }
//   }
// }
//
// class SignUpAgrementSwitch extends StatelessWidget {
//   const SignUpAgrementSwitch({
//     Key? key,
//     required this.title,
//     required this.subTitle,
//     required this.value,
//     required this.onChange,
//   }) : super(key: key);
//   final String title;
//   final Widget subTitle;
//   final bool value;
//   final Function(bool) onChange;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Transform.scale(
//           scale: .7,
//           child: CupertinoSwitch(
//             value: value,
//             onChanged: onChange,
//             activeColor: AppColors.primaryActiveColor,
//             trackColor: AppColors.primaryInactive,
//           ),
//         ),
//         SizedBox(
//           width: 23.w,
//         ),
//         Expanded(
//           child: SizedBox(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 7.h,
//                 ),
//                 Text(
//                   title,
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle1
//                       ?.copyWith(color: AppColors.primaryActiveColor),
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 subTitle,
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
