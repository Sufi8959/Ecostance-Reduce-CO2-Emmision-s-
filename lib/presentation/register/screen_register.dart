import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/data/register/repository/repository.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/register/bloc/register_bloc_bloc.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';

import '../../app/constants/string_constants.dart';
import '../app_widgets/outlined_button.dart';
import '../app_widgets/text_input_field.dart';
import '../resources/ui_widgets/top_wave.dart';

class ScreenRegister extends StatefulWidget {
  ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  final TextEditingController _emailEditingController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.fetchProfile());
    BlocProvider.of<RegisterBloc>(context)
        .add(const RegisterBlocEvent.setToInitial());
    BlocProvider.of<RegisterBloc>(context)
        .add(const RegisterBlocEvent.changePage(RegCurrentPage.register));

    _passwordEditingController.addListener(() {
      _checkPassword(_passwordEditingController.text.trim(), context);
    });
    super.initState();
  }

  final Map<String, GlobalKey<FormState>> formKey = {
    "email": GlobalKey<FormState>(),
    "password": GlobalKey<FormState>(),
    "confPassword": GlobalKey<FormState>(),
  };
  final Map<String, FocusNode> nodes = {
    "email": FocusNode(),
    "password": FocusNode(),
    "confPassword": FocusNode(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          BlocProvider.of<RegisterBloc>(context)
              .add(const RegisterBlocEvent.setToInitial());

          return true;
        },
        child: BlocConsumer<RegisterBloc, RegisterBlocState>(
          listenWhen: (p, c) => c.regCurrentPage == RegCurrentPage.register,
          listener: (context, state) {
            if (state.registrationSuccessful) {
              BlocProvider.of<RegisterBloc>(context)
                  .add(const RegisterBlocEvent.changePage(RegCurrentPage.otp));
              Navigator.pushNamed(context, Routes.screenRegistrationEnterOtp,
                      arguments: OtpVerificationArguments(
                          _emailEditingController.text, Routes.registerRoute))
                  .then((value) {
                BlocProvider.of<RegisterBloc>(context)
                    .add(const RegisterBlocEvent.setToInitial());
                Navigator.pop(context, value);
              });
            }
            if (state.showASnackBar != null && state.showASnackBar == true) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.snackMessage ?? ''),
                ),
              );
              Future.delayed(const Duration(seconds: 3), () {
                ScaffoldMessenger.of(context).removeCurrentSnackBar();
              });
              BlocProvider.of<RegisterBloc>(context)
                  .add(const RegisterBlocEvent.removeSnack());
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              opacity: 0,
              inAsyncCall: state.isLoading,
              progressIndicator: const Opacity(
                  opacity: 0, child: CupertinoActivityIndicator()),
              child: Scaffold(
                appBar: buildAppAppBar(() {
                  Navigator.pop(context);
                  BlocProvider.of<RegisterBloc>(context)
                      .add(const RegisterBlocEvent.setToInitial());
                }),
                body: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        // Text(
                        //   "Registration",
                        //   textAlign: TextAlign.left,
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .headline2
                        //       ?.copyWith(
                        //           color: AppColors.primaryActiveColor,
                        //           height: 1.222),
                        // ),
                        // SizedBox(
                        //   height: 3.h,
                        // ),
                        Text(
                          "Create an account and start saving nature.",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Form(
                                key: formKey['email'],
                                child: InputField(
                                  // fieldKey: _passwordFieldKey,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(' '))
                                  ],
                                  errorText: 'Enter a valid email',
                                  label: "Email",

                                  textEditingController:
                                      _emailEditingController,
                                  obscureText: false,
                                  inputType: TextInputType.text,
                                  hintText: "Email",
                                  validator: (val) {
                                    if (val!.isEmpty ||
                                        !AppConstants.emailRegExp
                                            .hasMatch(val)) {
                                      return 'Enter Valid Email';
                                    }
                                    return null;
                                  },
                                  //  onChanged: (val)=>formKey['email']?.currentState?.validate(),
                                  onUnfocused: () => formKey['email']
                                      ?.currentState
                                      ?.validate(),
                                  focusNode: nodes['email'],
                                  onFocused: () {},
                                ),
                              ),

                              SizedBox(
                                height: 22.h,
                              ),
                              Form(
                                key: formKey['password'],
                                child: InputField(
                                  // fieldKey: _passwordFieldKey,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(' '))
                                  ],
                                  errorText: 'Enter Valid Password',
                                  label: "Password",
                                  suffixIcon: Icons.remove_red_eye,
                                  textEditingController:
                                      _passwordEditingController,
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
                                  //  onChanged: (val)=>formKey['password']?.currentState?.validate(),
                                  focusNode: nodes['password'],
                                  onUnfocused: () => formKey['password']
                                      ?.currentState
                                      ?.validate(),

                                  onFocused: () {},
                                ),
                              ),
                              SizedBox(
                                height: 22.h,
                              ),
                              Form(
                                key: formKey['confPassword'],
                                child: InputField(
                                  // fieldKey: _conformPasswordKey,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(' '))
                                  ],
                                  label: "Confirm password",
                                  suffixIcon: Icons.remove_red_eye,
                                  textEditingController:
                                      _confirmPasswordEditingController,
                                  obscureText: true,
                                  inputType: TextInputType.text,
                                  hintText: "Confirm password",
                                  validator: (val) {
                                    if (_passwordEditingController.text
                                            .trim() !=
                                        _confirmPasswordEditingController.text
                                            .trim()) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  onChanged: (val) => formKey['confPassword']
                                      ?.currentState
                                      ?.validate(),
                                  onUnfocused: () => formKey['confPassword']
                                      ?.currentState
                                      ?.validate(),
                                  focusNode: nodes['confPassword'],
                                  onFocused: () {},
                                  errorText: 'Passwords do not match',
                                ),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    4,
                                    (index) => Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 4.w),
                                            width: 77.w,
                                            height: 7.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                                color: index <
                                                        state.strengthNumber
                                                    ? getStrengthBarColor(
                                                        state.strengthNumber)
                                                    : AppColors.lightGrey),
                                          ),
                                        )),
                              ),
                              SizedBox(
                                height: 18.h,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 6.w),
                                  child: Text(
                                    state.strengthText,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              SignUpAgrementSwitch(
                                title: "Terms and Conditions",
                                subTitle: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "I agree with ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextSpan(
                                        text: "Terms & Conditions",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                decoration:
                                                    TextDecoration.underline)),
                                    TextSpan(
                                        text: " and ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    TextSpan(
                                        text: "Privacy Policy",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                decoration:
                                                    TextDecoration.underline))
                                  ]),
                                ),
                                value: state.terms,
                                onChange: (newVal) {
                                  BlocProvider.of<RegisterBloc>(context)
                                      .add(RegisterBlocEvent.setTerms(newVal));
                                },
                              ),
                              // if(!_formKey.currentState!.validate() && !state.terms)
                              // Padding(
                              //   padding:  EdgeInsets.symmetric(horizontal: 14.w),
                              //   child:  Text("Please accept terms and condition",style:GoogleFonts.workSans(color: AppColors.redAccent),),
                              // ),
                              SizedBox(
                                height: 14.h,
                              ),
                              SignUpAgrementSwitch(
                                title: "Newsletter",
                                subTitle: Text(
                                  "I want to receive any updates and newsletter on my email",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                value: state.newsLetter,
                                onChange: (newVal) {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                      RegisterBlocEvent.setNewsLetter(newVal));
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        AppButton2(
                          onTap: () async {
                            if (_passwordEditingController.text.trim() !=
                                _confirmPasswordEditingController.text.trim()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Passwords do not match')));
                              return;
                            }
                            for (var element in formKey.entries) {
                              if (!element.value.currentState!.validate()) {
                                nodes[element.key]?.requestFocus();
                                return;
                              }
                            }

                            if (!state.terms) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Agreement to terms of service is required')));
                              return;
                            }

                            BlocProvider.of<RegisterBloc>(context)
                                .add(RegisterBlocEvent.registerButtonPressed(
                                    registerRequest: RegisterRequest(
                              email: _emailEditingController.text.toLowerCase(),
                              password: _passwordEditingController.text,
                              confirmPassword: _passwordEditingController.text,
                              newsLetter: state.newsLetter,
                            )));
                          },
                          text: Text(
                            ButtonStrings.signUp,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          filled: true,
                          height: 60.h,
                          feedbackTimeText: Text(
                            ButtonStrings.signUp,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: AppColors.primaryActiveColor),
                          ),
                          isLoading: state.isLoading,
                        ),
                        // SizedBox(
                        //   height: 69.h,
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  //
  // Poor: #F02849
  // Weak: #FFBA0D
  // Good: #FFA500
  // Strong: #008000
  RegExp numReg = RegExp(r".*[0-9].*");

  RegExp upperCaseReg = RegExp(r".*[A-Z].*");

  RegExp lowerCaseReg = RegExp(r".*[a-z].*");

  RegExp regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

  void _checkPassword(String? value, BuildContext context) {
    if (value == null) {
      return;
    }
    final password = value.trim();
    if (password.isEmpty) {
      BlocProvider.of<RegisterBloc>(context).add(
          const RegisterBlocEvent.setPasswordStrength(text: '', strength: 0));

      return;
    }
    if (password.length >= 12 && regExp.hasMatch(password)) {
      BlocProvider.of<RegisterBloc>(context).add(
          const RegisterBlocEvent.setPasswordStrength(
              text: 'Strong', strength: 4));
      return;
    }
    if (password.length >= 8 && regExp.hasMatch(password)) {
      BlocProvider.of<RegisterBloc>(context).add(
          const RegisterBlocEvent.setPasswordStrength(
              text: 'Good', strength: 3));

      return;
    }
    if (password.length > 8 && !regExp.hasMatch(password)) {
      BlocProvider.of<RegisterBloc>(context).add(
          const RegisterBlocEvent.setPasswordStrength(
              text: 'Weak', strength: 2));

      return;
    }
    if (password.length < 8 || !regExp.hasMatch(password)) {
      BlocProvider.of<RegisterBloc>(context).add(
          const RegisterBlocEvent.setPasswordStrength(
              text: 'Poor', strength: 1));

      return;
    }
  }

  // Poor: #F02849
  // Weak: #FFBA0D
  // Good: #FFA500
  // Strong: #008000

  Color getStrengthBarColor(int strength) {
    switch (strength) {
      case 1:
        return const Color(0xFFF02849);

      case 2:
        return const Color(0xFFFFBA0D);
      case 3:
        return const Color(0xFFFFA500);

      case 4:
        return const Color(0xFF008000);

      case 0:
        return AppColors.appGreyColor;

      default:
        {
          return AppColors.appGreyColor;
        }
    }
  }
}

class SignUpAgrementSwitch extends StatelessWidget {
  const SignUpAgrementSwitch({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.onChange,
  }) : super(key: key);
  final String title;
  final Widget subTitle;
  final bool value;
  final Function(bool) onChange;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.scale(
          scale: .7,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChange,
            activeColor: AppColors.primaryActiveColor,
            trackColor: AppColors.primaryInactive,
          ),
        ),
        SizedBox(
          width: 23.w,
        ),
        Expanded(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.primaryActiveColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                subTitle,
              ],
            ),
          ),
        )
      ],
    );
  }
}
