import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/data/user_profile/repository/repository.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/app_widgets/text_input_field.dart';
import 'package:net_carbons/presentation/profile/child_screens/change_email/verification_stepper.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../data/core/general/failiure.dart';

enum ChangeEmailStatus { initial, loading, failed, success }

enum ChangeRecoveryEmailStatus { initial, loading, failed, success }

enum ChangeEmailType { primary, recovery }

class ChangeEmailOpData {
  final ChangeEmailType changeEmailType;
  final String newEmail;
  ChangeEmailOpData({required this.newEmail, required this.changeEmailType});
}

class ScreenChangeEmail extends StatefulWidget {
  const ScreenChangeEmail(
      {Key? key,
      required this.currentEmail,
      required this.currentRecoveryEmail})
      : super(key: key);
  final String currentEmail;
  final String currentRecoveryEmail;
  @override
  State<ScreenChangeEmail> createState() => _ScreenChangeEmailState();
}

class _ScreenChangeEmailState extends State<ScreenChangeEmail> {
  final repository = getIt<UserProfileRepository>();

  final TextEditingController _emailEditingController = TextEditingController();

  final TextEditingController _secondaryEmailEditingController =
      TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode recoveryEmailNode = FocusNode();
  @override
  void initState() {
    _emailEditingController.text = widget.currentEmail;
    _secondaryEmailEditingController.text = widget.currentRecoveryEmail;
    emailNode.addListener(() {
      setState(() {});
    });
    recoveryEmailNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    emailNode.dispose();
    recoveryEmailNode.dispose();
    super.dispose();
  }

  ChangeEmailStatus changeEmailStatus = ChangeEmailStatus.initial;
  ChangeRecoveryEmailStatus changeRecoveryEmailStatus =
      ChangeRecoveryEmailStatus.initial;

  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _recoveryEmailFormKey = GlobalKey<FormState>();

  bool primaryLoading = false;
  bool recoveryLoading = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder<dartz.Either<Failure, Response<dynamic>>>(
        future: repository.getEmailUpdateAttempts(),
        builder: (context, snapshot) {
          bool allowUpdate = false;
          if (snapshot.hasData) {
            snapshot.data?.fold((l) {}, (r) {
              final atempts = r.data["primaryEmailChangeAttemptCount"];
              if (atempts <= 4) {
                allowUpdate = true;
              }
            });
          }
          return Scaffold(
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
                          "Change email",
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
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: _emailFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Primary Email',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        TextFormField(
                          readOnly:
                              changeEmailStatus == ChangeEmailStatus.success,
                          autofocus: false,
                          focusNode: emailNode,
                          onTap: () {},
                          onEditingComplete: () {},
                          onChanged: (val) {},
                          autocorrect: false,
                          validator: (val) {
                            if (val!.isEmpty ||
                                !AppConstants.emailRegExp.hasMatch(val)) {
                              return 'Enter Valid Email';
                            }

                            return null;
                          },
                          controller: _emailEditingController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.primaryActiveColor),
                          decoration: InputDecoration(
                              enabledBorder: null,
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.redAccent),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  if (!allowUpdate) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Email update attempts exceeded, Please re-login and try again')));
                                    return;
                                  }
                                  emailNode.requestFocus();
                                },
                                child: Container(
                                  margin: EdgeInsets.all(12.w),
                                  width: 55.h,
                                  height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      changeEmailStatus ==
                                              ChangeEmailStatus.success
                                          ? SizedBox(
                                              height: 24.h,
                                              width: 24.h,
                                              child: SvgPicture.asset(
                                                  SvgAssets.couponTickMark))
                                          : SizedBox(),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Container(
                                        height: 24.h,
                                        width: 24.h,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    ImageAssets.edit))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.appGreyColor)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  emailNode.hasFocus
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 110.w,
                              child: AppButton2(
                                  isLoading: primaryLoading,
                                  filled: true,
                                  filledColor: AppColors.selectedGreen,
                                  height: 34.h,
                                  onTap: () {
                                    if (primaryLoading) {
                                      return;
                                    }
                                    if (!allowUpdate) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Email update attempts exceeded, Please re-login and try again')));

                                      return;
                                    }
                                    if (widget.currentEmail ==
                                        _emailEditingController.text.trim()) {
                                      emailNode.unfocus();
                                      return;
                                    }
                                    if (_emailFormKey.currentState == null) {
                                      return;
                                    }
                                    if (!_emailFormKey.currentState!
                                        .validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Enter a valid email')));
                                      return;
                                    }
                                    setState(() {
                                      primaryLoading = true;
                                    });
                                    repository
                                        .updatePrimaryEmail(
                                            _emailEditingController.text.trim())
                                        .then((value) => value.fold((l) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content:
                                                          Text(l.message)));
                                              setState(() {
                                                primaryLoading = false;
                                              });
                                            }, (r) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ChangeEmailVerificationStepper(
                                                            changeEmailOpData: ChangeEmailOpData(
                                                                newEmail:
                                                                    _emailEditingController
                                                                        .text
                                                                        .trim(),
                                                                changeEmailType:
                                                                    ChangeEmailType
                                                                        .primary),
                                                          ))).then((value) {
                                                if (value
                                                    is ChangeEmailStatus) {
                                                  changeEmailStatus = value;

                                                  if (value ==
                                                      ChangeEmailStatus
                                                          .success) {
                                                    emailNode.unfocus();
                                                  }
                                                }
                                                setState(() {});
                                              });
                                              setState(() {
                                                primaryLoading = false;
                                              });
                                            }));
                                  },
                                  text: Text(
                                    'Save',
                                    style: textTheme.headline2,
                                  ),
                                  feedbackTimeText: Text(
                                    'Save',
                                    style: textTheme.headline2?.copyWith(
                                        color: AppColors.primaryActiveColor),
                                  )),
                            ),
                            SizedBox(
                              width: 20.h,
                            ),
                            SizedBox(
                                width: 110.w,
                                child: AppButton(
                                    filled: true,
                                    filledColor: AppColors.primaryActiveColor,
                                    height: 34.h,
                                    onTap: () {
                                      emailNode.unfocus();
                                    },
                                    text: Text(
                                      'Cancel',
                                      style: textTheme.headline2,
                                    ),
                                    feedbackTimeText: Text(
                                      'Cancel',
                                      style: textTheme.headline2?.copyWith(
                                          color: AppColors.primaryActiveColor),
                                    ))),
                          ],
                        )
                      : SizedBox(),
                  SizedBox(
                    height: 30.h,
                  ),
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  Form(
                    key: _recoveryEmailFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Secondary Email',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        TextFormField(
                          readOnly: changeRecoveryEmailStatus ==
                              ChangeRecoveryEmailStatus.success,
                          autofocus: false,
                          focusNode: recoveryEmailNode,
                          onTap: () {},
                          onEditingComplete: () {},
                          onChanged: (val) {},
                          autocorrect: false,
                          validator: (val) {
                            if (val!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)) {
                              return 'Enter Valid Email';
                            }

                            return null;
                          },
                          controller: _secondaryEmailEditingController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 16.sp,
                                  color: AppColors.primaryActiveColor),
                          decoration: InputDecoration(
                              enabledBorder: null,
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.redAccent),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  if (changeRecoveryEmailStatus ==
                                      ChangeRecoveryEmailStatus.success) {
                                    return;
                                  }
                                  recoveryEmailNode.requestFocus();
                                },
                                child: Container(
                                  margin: EdgeInsets.all(12.w),
                                  width: 55.h,
                                  height: 20.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      changeRecoveryEmailStatus ==
                                              ChangeRecoveryEmailStatus.success
                                          ? SizedBox(
                                              height: 24.h,
                                              width: 24.h,
                                              child: SvgPicture.asset(
                                                  SvgAssets.couponTickMark))
                                          : SizedBox(),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      Container(
                                        height: 24.h,
                                        width: 24.h,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    ImageAssets.edit))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: AppColors.appGreyColor)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  recoveryEmailNode.hasFocus
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 110.w,
                              child: AppButton2(
                                  isLoading: recoveryLoading,
                                  filled: true,
                                  filledColor: AppColors.selectedGreen,
                                  height: 34.h,
                                  onTap: () {
                                    if (recoveryLoading) {
                                      return;
                                    }
                                    if (widget.currentEmail ==
                                        _secondaryEmailEditingController.text
                                            .trim()) {
                                      recoveryEmailNode.unfocus();
                                      return;
                                    }
                                    if (_recoveryEmailFormKey.currentState ==
                                        null) {
                                      return;
                                    }
                                    if (!_recoveryEmailFormKey.currentState!
                                        .validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Enter a valid email')));
                                      return;
                                    }
                                    setState(() {
                                      recoveryLoading = true;
                                    });
                                    repository
                                        .updateRecoveryEmail(
                                            _secondaryEmailEditingController
                                                .text
                                                .trim())
                                        .then((value) => value.fold((l) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content:
                                                          Text(l.message)));
                                              setState(() {
                                                recoveryLoading = false;
                                              });
                                            }, (r) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ChangeEmailVerificationStepper(
                                                            changeEmailOpData: ChangeEmailOpData(
                                                                newEmail:
                                                                    _secondaryEmailEditingController
                                                                        .text
                                                                        .trim(),
                                                                changeEmailType:
                                                                    ChangeEmailType
                                                                        .recovery),
                                                          ))).then((value) {
                                                if (value
                                                    is ChangeRecoveryEmailStatus) {
                                                  changeRecoveryEmailStatus =
                                                      value;

                                                  if (value ==
                                                      ChangeRecoveryEmailStatus
                                                          .success) {
                                                    recoveryEmailNode.unfocus();
                                                  }
                                                  setState(() {});
                                                }
                                              });
                                              setState(() {
                                                recoveryLoading = false;
                                              });
                                            }));
                                  },
                                  text: Text(
                                    'Save',
                                    style: textTheme.headline2,
                                  ),
                                  feedbackTimeText: Text(
                                    'Save',
                                    style: textTheme.headline2?.copyWith(
                                        color: AppColors.primaryActiveColor),
                                  )),
                            ),
                            SizedBox(
                              width: 20.h,
                            ),
                            SizedBox(
                                width: 110.w,
                                child: AppButton(
                                    filled: true,
                                    filledColor: AppColors.primaryActiveColor,
                                    height: 34.h,
                                    onTap: () {},
                                    text: Text(
                                      'Cancel',
                                      style: textTheme.headline2,
                                    ),
                                    feedbackTimeText: Text(
                                      'Cancel',
                                      style: textTheme.headline2?.copyWith(
                                          color: AppColors.primaryActiveColor),
                                    ))),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            ),
          );
        });
  }

  Future<dartz.Either<Failure, dynamic>> _sendEmailOtpRECOVERY(String email) {
    return repository.updateRecoveryEmail(email);
  }

  // _initEmailOtpRECOVERY() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   final res = await _sendEmailOtpRECOVERY();
  //   res.fold((l) {
  //     if (mounted) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       Navigator.pop(
  //           context,
  //           widget.changeEmailOpData.changeEmailType == ChangeEmailType.primary
  //               ? ChangeEmailStatus.failed
  //               : ChangeRecoveryEmailStatus.failed);
  //     }
  //   }, (r) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }
}
