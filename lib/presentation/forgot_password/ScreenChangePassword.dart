import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/forgot_password/repository/repository.dart';
import 'package:net_carbons/domain/forgot_password/modal/resp_modal.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../app_widgets/text_input_field.dart';
import '../resources/color.dart';

class ScreenChangePassword extends StatefulWidget {
  const ScreenChangePassword({super.key});

  @override
  State<ScreenChangePassword> createState() => _ScreenChangePasswordState();
}

class _ScreenChangePasswordState extends State<ScreenChangePassword> {
  String? password;
  String? confirmPassword;
  final _formKey = GlobalKey<FormState>();
  final repository = getIt<ForgotPasswordRepository>();
  final TextEditingController _currenctPasswordEditingController =
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

    return Scaffold(
      appBar: buildAppAppBar(() => Navigator.pop(context)),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(' '))
                ],
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
                height: 16.h,
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
                height: 16.h,
              ),
              InputField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(' '))
                ],
                errorText: 'Enter Valid Password',
                label: "Password",
                suffixIcon: Icons.remove_red_eye,
                textEditingController: _passwordConfirmEditingController,
                obscureText: true,
                inputType: TextInputType.text,
                hintText: "Password",
                validator: (val) {
                  if (_passwordEditingController.text.trim() !=
                      _passwordConfirmEditingController.text.trim()) {
                    return 'Enter Valid Password';
                  }
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
                height: 20.h,
              ),
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
                      context: context,
                      builder: (context) {
                        return const Center(
                            child: CupertinoActivityIndicator());
                      });
                  final resp = await repository.changePassword(
                      args.token,
                      _passwordEditingController.text.trim(),
                      _passwordConfirmEditingController.text.trim(),
                      _currenctPasswordEditingController.text.trim());
                  resp.fold((l) {}, (r) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Password changed successfully'),
                    ));

                    Navigator.pushNamed(context, Routes.loginRoute);
                  });
                },
                text: Text(
                  ButtonStrings.changePassword,
                  style: Theme.of(context).textTheme.headline2,
                ),
                feedbackTimeText: Text(
                  ButtonStrings.changePassword,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: AppColors.primaryActiveColor),
                ),
              )
            ],
          ),
        ),
      )),
    );
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
}
