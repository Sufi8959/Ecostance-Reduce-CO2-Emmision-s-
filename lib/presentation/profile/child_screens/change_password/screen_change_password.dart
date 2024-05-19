import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/app_widgets/text_input_field.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../../../../../app/dependency.dart';
import '../../../../../data/forgot_password/repository/repository.dart';
import '../../../../../domain/forgot_password/modal/resp_modal.dart';

class ScreenSettingsChangePassword extends StatefulWidget {
  const ScreenSettingsChangePassword({Key? key}) : super(key: key);

  @override
  State<ScreenSettingsChangePassword> createState() =>
      _ScreenSettingsChangePasswordState();
}

class _ScreenSettingsChangePasswordState
    extends State<ScreenSettingsChangePassword> {
  String? password;
  String? confirmPassword;
  final _formKey = GlobalKey<FormState>();
  final repository = getIt<ForgotPasswordRepository>();
  final TextEditingController _currentPasswordEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _passwordConfirmEditingController =
      TextEditingController();

  String _strengthText = 'Please enter a password';
  int _strength = 0;

  @override
  void initState() {
    _passwordEditingController.addListener(() {
      _checkPassword(_passwordEditingController.text.trim());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as OtpSubmitResponseModalSuccess;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    "Change password",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 54.h,
              ),
              InputField(
                errorText: 'Wrong Password',
                label: "Current Password",
                suffixIcon: Icons.remove_red_eye,
                textEditingController: _currentPasswordEditingController,
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
                onFocused: () {},
                onUnfocused: () {},
              ),
              SizedBox(
                height: 54.h,
              ),
              InputField(
                errorText: 'Enter Valid Password',
                label: "Password",
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
                onFocused: () {},
                onUnfocused: () {},
              ),
              SizedBox(
                height: 9.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    4,
                    (index) => Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 4.w),
                            width: 77.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: index < _strength
                                    ? getStrengthBarColor(_strength)
                                    : AppColors.lightGrey),
                          ),
                        )),
              ),
              SizedBox(
                height: 18.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Text(
                    _strengthText,
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              InputField(
                label: "Confirm password",
                suffixIcon: Icons.remove_red_eye,
                textEditingController: _passwordConfirmEditingController,
                obscureText: true,
                inputType: TextInputType.text,
                hintText: "Confirm password",
                validator: (val) {
                  if (_passwordEditingController.text.trim() !=
                      _passwordConfirmEditingController.text.trim()) {
                    return 'Password dose not match';
                  }
                  return null;
                },
                onFocused: () {},
                onUnfocused: () {},
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(child: SizedBox()),
              AppButton(
                filled: true,
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please enter a valid password")));
                    return;
                  }
                  if (_passwordConfirmEditingController.text.trim() !=
                      _passwordEditingController.text.trim()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Password mismatch")));
                    return;
                  }
                  showCupertinoModalPopup(
                      semanticsDismissible: false,
                      context: context,
                      builder: (popCtx) {
                        onButtonPress(args, context).then((value) {
                          if (value) {
                            Navigator.pop(context);
                          }
                        });
                        return const Center(
                            child: CupertinoActivityIndicator());
                      });
                },
                text: Text(
                  "SAVE",
                  style: Theme.of(context).textTheme.headline2,
                ),
                feedbackTimeText: Text(
                  "SAVE",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: AppColors.primaryActiveColor),
                ),
              ),
              SizedBox(
                height: 69.h,
              )
            ],
          ),
        ),
      ),
    );
  }

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp upperCaseReg = RegExp(r".*[A-Z].*");
  RegExp lowerCaseReg = RegExp(r".*[a-z].*");
  RegExp regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
  void _checkPassword(String? value) {
    if (value == null) {
      return;
    }
    final password = value.trim();
    if (password.isEmpty) {
      setState(() {
        _strength = 0;
        _strengthText = 'Please enter a password';
      });
      return;
    }
    if (password.length >= 12 && regExp.hasMatch(password)) {
      setState(() {
        _strength = 4;
        _strengthText = "Strong";
      });
      return;
    }
    if (password.length >= 8 && regExp.hasMatch(password)) {
      setState(() {
        _strength = 3;
        _strengthText = "Good";
      });
      return;
    }
    if (password.length > 8 && !regExp.hasMatch(password)) {
      setState(() {
        _strength = 2;
        _strengthText = "Weak";
      });
      return;
    }
    if (password.length < 8 || !regExp.hasMatch(password)) {
      setState(() {
        _strength = 1;
        _strengthText = "Poor";
      });
      return;
    }
  }

  Future<bool> onButtonPress(
      OtpSubmitResponseModalSuccess args, BuildContext context) async {
    final resp = await repository.changePassword(
        args.token,
        _passwordEditingController.text.trim(),
        _passwordConfirmEditingController.text.trim(),
        _currentPasswordEditingController.text.trim());
    return resp.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(l.message),
      ));
      return false;
    }, (r) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password updated successfully'),
      ));
      return true;
    });
  }

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
