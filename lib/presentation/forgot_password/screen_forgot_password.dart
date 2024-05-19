import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/forgot_password/repository/repository.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../../app/constants/string_constants.dart';
import '../app_widgets/text_input_field.dart';

class ScreenForgotPassword extends StatefulWidget {
  ScreenForgotPassword({super.key});

  @override
  State<ScreenForgotPassword> createState() => _ScreenForgotPasswordState();
}

class _ScreenForgotPasswordState extends State<ScreenForgotPassword> {
  final repository = getIt<ForgotPasswordRepository>();
  bool _isLoading = false;

  final TextEditingController _emailNameEditingController =
      TextEditingController();
  final key = GlobalKey<FormState>();
  FocusNode _emailNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      progressIndicator: CupertinoActivityIndicator(),
      child: Scaffold(
        appBar: buildAppAppBar(() => Navigator.pop(context)),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: key,
                      child: InputField(
                        focusNode: _emailNode,
                        errorText: 'Enter a valid email',
                        validator: (val) {
                          if (val!.isEmpty ||
                              !AppConstants.emailRegExp.hasMatch(val)) {
                            return 'Enter Valid Email';
                          }
                          return null;
                        },
                        textEditingController: _emailNameEditingController,
                        label: 'Email',
                        hintText: 'Email',
                        onFocused: () {},
                        onUnfocused: () {},
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: AppButton2(
                        isLoading: _isLoading,
                        onTap: () async {
                          if (!key.currentState!.validate()) {
                            return;
                          }
                          if (_emailNameEditingController.text.isNotEmpty) {
                            setState(() {
                              _isLoading = true;
                            });
                            final resp = await repository
                                .requestOtp(_emailNameEditingController.text);
                            resp.fold(
                              (l) => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l.message),
                                ),
                              ),
                              (r) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(r.message),
                                  ),
                                );

                                WidgetsBinding.instance
                                    .addPostFrameCallback((timeStamp) {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.enterOtpScreen,
                                    arguments: OtpVerificationArguments(
                                        _emailNameEditingController.text,
                                        Routes.forgetPasswordRoute),
                                  );
                                });
                              },
                            );
                            setState(() {
                              _isLoading = false;
                            });
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please enter your email'),
                            ));
                          }
                        },
                        text: Text(
                          ButtonStrings.getOTP,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        filled: true,
                        feedbackTimeText: Text(
                          ButtonStrings.getOTP,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back to Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.appGreyColor),
                        )),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
