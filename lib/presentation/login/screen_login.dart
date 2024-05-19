import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/data/login/repository/repository.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/login/bloc/login_bloc.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../../app/dependency.dart';
import '../../data/register/repository/repository.dart';
import '../app_widgets/text_input_field.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _userNameEditingController =
      TextEditingController();

  final TextEditingController _passwordEditingController =
      TextEditingController();

  final regRepository = getIt<RegisterRepository>();
  @override
  void initState() {
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.fetchProfile());

    BlocProvider.of<LoginBloc>(context)
        .add(LoginEvent.setPage(loginCurrentPage: LoginCurrentPage.loginPage));
    super.initState();
  }

  int failedAttempts = 0;
  String blockedMail = '';

  final Map<String, GlobalKey<FormState>> formKey = {
    "email": GlobalKey<FormState>(),
    "password": GlobalKey<FormState>(),
  };
  final Map<String, FocusNode> nodes = {
    "email": FocusNode(),
    "password": FocusNode(),
  };
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (BlocProvider.of<LoginBloc>(context).state.isLoading) return false;
          BlocProvider.of<LoginBloc>(context).add(const LoginEvent.setPage(
              loginCurrentPage: LoginCurrentPage.initial));
          BlocProvider.of<LoginBloc>(context).add(const LoginEvent.setSnackBar(
              showSnackBar: false, snackMessage: ''));
          return true;
        },
        child: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (prev, curr) =>
              curr.loginCurrentPage == LoginCurrentPage.loginPage,
          listener: (context, state) {
            if (state.loginStatus == LoginStatus.success) {
              Navigator.pop(context, VerifyStatusEum.VERIFIED);
              return;
            }
            if (state.loginStatus == LoginStatus.unVerified) {
              BlocProvider.of<LoginBloc>(context).add(const LoginEvent.setPage(
                  loginCurrentPage: LoginCurrentPage.initial));

              BlocProvider.of<LoginBloc>(context).add(
                  const LoginEvent.setSnackBar(
                      showSnackBar: false, snackMessage: ''));

              regRepository.resendOtp(state.authDataModal!.user.email);

              Navigator.pushNamed(context, Routes.screenRegistrationEnterOtp,
                      arguments: OtpVerificationArguments(
                          state.authDataModal!.user.email, Routes.loginRoute))
                  .then((value) {
                BlocProvider.of<LoginBloc>(context)
                    .add(const LoginEvent.setToIntital());
                Navigator.pop(context, value);
              });
              return;
            }

            if (state.loginStatus == LoginStatus.failed &&
                state.showASnackBar == true) {
              if (state.snackMessage != null) {
                if (state.snackMessage!.toLowerCase().contains("wrong email")) {
                  failedAttempts += 1;
                }
              }
              _showSnackBar(context, state);

              // Future.delayed(const Duration(seconds: 10), () {
              //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
              // });
              // Future.delayed(Duration(seconds: 5), () {
              //   BlocProvider.of<LoginBloc>(context).add(
              //       const LoginEvent.setSnackBar(
              //           showSnackBar: false, snackMessage: ''));
              // });
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              opacity: 0,
              progressIndicator: const Opacity(
                  opacity: 0, child: CupertinoActivityIndicator()),
              inAsyncCall: state.isLoading ||
                  BlocProvider.of<AuthBloc>(context).state is AuthLoading,
              child: Scaffold(
                appBar: buildAppAppBar(() {
                  BlocProvider.of<LoginBloc>(context).add(
                      const LoginEvent.setPage(
                          loginCurrentPage: LoginCurrentPage.initial));
                  Navigator.pop(context);
                }),
                body: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.height / 2,
                        child: SingleChildScrollView(
                          child: Container(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height / 2,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage(ImageAssets.loginScreenBtm)),
                              )),
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 32.h,
                              ),
                              Text(
                                "Log in with your email and password",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(
                                height: 28.h,
                              ),
                              Form(
                                key: formKey['email'],
                                child: InputField(
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(' ')),
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z.0-9.!@#\$%^&*()_+=-]")),
                                  ],
                                  suggestBer: false,
                                  autoCorrect: false,
                                  label: "Email",
                                  textEditingController:
                                      _userNameEditingController,
                                  inputType: TextInputType.emailAddress,
                                  hintText: "Email",
                                  errorText: 'Enter a valid email',
                                  validator: (val) {
                                    if (val!.isEmpty ||
                                        !AppConstants.emailRegExp
                                            .hasMatch(val)) {
                                      return 'Enter Valid Email';
                                    }
                                    return null;
                                  },
                                  onUnfocused: () => formKey['email']
                                      ?.currentState
                                      ?.validate(),
                                  focusNode: nodes['email'],
                                  onFocused: () {},
                                ),
                              ),
                              SizedBox(
                                height: 28.h,
                              ),
                              Form(
                                key: formKey['password'],
                                child: InputField(
                                  textInputAction: TextInputAction.next,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(' ')),
                                  ],
                                  label: "Password",
                                  suffixIcon: Icons.remove_red_eye,
                                  textEditingController:
                                      _passwordEditingController,
                                  obscureText: true,
                                  inputType: TextInputType.text,
                                  errorText: 'Enter a valid password',
                                  hintText: "Password",
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Enter Valid Password';
                                    }
                                    return null;
                                  },
                                  onUnfocused: () => formKey['password']
                                      ?.currentState
                                      ?.validate(),
                                  focusNode: nodes['password'],
                                  onFocused: () {},
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        const LoginEvent.setSnackBar(
                                            showSnackBar: false,
                                            snackMessage: ''));
                                    Navigator.pushNamed(
                                        context, Routes.forgetPasswordRoute);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                            height: 1.18,
                                            color: AppColors.primaryActiveColor,
                                            decoration:
                                                TextDecoration.underline),
                                  )),
                              SizedBox(
                                height: 24.h,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        const LoginEvent.setSnackBar(
                                            showSnackBar: false,
                                            snackMessage: ''));
                                    ScaffoldMessenger.of(context)
                                        .removeCurrentSnackBar();
                                    //TODO: FIX null error
                                    Navigator.pushReplacementNamed(
                                            context, Routes.registerRoute)
                                        .then((value) =>
                                            Navigator.pop(context, value));
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                        text: "Don't have a profile? Kindly ",
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: 'Register Now',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                    height: 1.18,
                                                    color: AppColors
                                                        .primaryActiveColor,
                                                    decoration: TextDecoration
                                                        .underline),
                                          )
                                        ]),
                                  )),
                              SizedBox(
                                height: 30.h,
                              ),
                              AppButton2(
                                onTap: () {
                                  for (var element in formKey.entries) {
                                    if (!element.value.currentState!
                                        .validate()) {
                                      scrollController.jumpTo(scrollController
                                          .position.minScrollExtent);
                                      nodes[element.key]?.requestFocus();

                                      return;
                                    }
                                  }
                                  ScaffoldMessenger.of(context)
                                      .removeCurrentSnackBar();

                                  _onLogin(context);
                                },
                                text: Text(ButtonStrings.login,
                                    style:
                                        Theme.of(context).textTheme.headline2),
                                filled: true,
                                height: 60.h,
                                feedbackTimeText: Text(ButtonStrings.login,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2
                                        ?.copyWith(
                                            color:
                                                AppColors.primaryActiveColor)),
                                isLoading: state.isLoading,
                              ),
                              SizedBox(
                                height: 69.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  void _showSnackBar(BuildContext context, LoginState state) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.snackMessage ?? ''),
        duration: const Duration(seconds: 4),
      ),
    );
    Future.delayed(const Duration(seconds: 4), () {
      BlocProvider.of<LoginBloc>(context).add(
          const LoginEvent.setSnackBar(showSnackBar: false, snackMessage: ''));
    });
  }

  void _onLogin(BuildContext context) async {
    if (blockedMail == _userNameEditingController.text.trim() &&
        failedAttempts >= 8) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: getAttemtBasedMessage(failedAttempts)));
      return;
    }
    BlocProvider.of<LoginBloc>(context).add(LoginEvent.loginButtonPressed(
        loginRequest: LoginRequest(
            password: _passwordEditingController.text,
            userId: _userNameEditingController.text.toLowerCase(),
            strategy: "password")));
  }

  Widget getAttemtBasedMessage(int val) {
    if (val == 5) {
      return RichText(
        text: const TextSpan(children: [
          TextSpan(text: "Wrong email or password \n"),
          TextSpan(text: "Your account will be locked after "),
          TextSpan(
              text: "3 ",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  "more unsuccessful attempt(s). Please reset your password by clicking “Forgot Password”"),
        ]),
      );
    } else if (val >= 8) {
      return accHoldRichText;
    }
    return const Text("Wrong email or password");
  }

  Widget accHoldRichText = RichText(
    text: const TextSpan(children: [
      TextSpan(text: "Your account is locked due to"),
      TextSpan(
          text: " 8 ",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold)),
      TextSpan(
          text:
              "unsuccessful attempt(s). Please reset your password by clicking “Forgot Password”"),
    ]),
  );
}


// if (state.snackMessage!.contains('hold')) {
//   setState(() {
//     failedAttempts = 8;
//     blockedMail = _userNameEditingController.text.trim();
//   });
//   ScaffoldMessenger.of(context).removeCurrentSnackBar();
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: const Text(
//         'Your account is on hold, Please reset your password by clicking “Forgot Password”'),
//     action: SnackBarAction(
//       label: 'Reset password',
//       onPressed: () {
//         ScaffoldMessenger.of(context).removeCurrentSnackBar();
//         BlocProvider.of<LoginBloc>(context).add(
//             const LoginEvent.setSnackBar(
//                 showSnackBar: false, snackMessage: ''));
//         Navigator.pushNamed(context, Routes.forgetPasswordRoute);
//       },
//     ),
//     duration: const Duration(days: 365),
//   ));
//   BlocProvider.of<LoginBloc>(context).add(
//       const LoginEvent.setSnackBar(
//           showSnackBar: false, snackMessage: ''));
//
//   return;
// }
// if (state.snackMessage!.contains('Internal')) {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text(state.snackMessage!.split("CD=")[0])));
//   BlocProvider.of<LoginBloc>(context).add(
//       const LoginEvent.setSnackBar(
//           showSnackBar: false, snackMessage: ''));
//   return;
// }

// ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: getAttemtBasedMessage(failedAttempts)));
