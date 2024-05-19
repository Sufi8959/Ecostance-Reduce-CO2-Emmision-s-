import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/data/delete_account/DeleteAccountRequest.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../app/auth/auth_bloc.dart';
import '../../../../app/constants/string_constants.dart';
import '../../../../app/dependency.dart';
import '../../../../data/core/network/dio.dart';
import '../../../../data/login/repository/repository.dart';
import '../../../app_widgets/outlined_button.dart';
import '../../../app_widgets/text_input_field.dart';
import '../../../login/bloc/login_bloc.dart';
import '../../../register/registration_otp_verification.dart';
import '../../../resources/route_manager.dart';

class ScreenDeleteAccountTwo extends StatefulWidget {
  ScreenDeleteAccountTwo({Key? key}) : super(key: key);

  @override
  State<ScreenDeleteAccountTwo> createState() => _ScreenDeleteAccountTwoState();
}

class _ScreenDeleteAccountTwoState extends State<ScreenDeleteAccountTwo> {

  final TextEditingController _passwordEditingController =
  TextEditingController();

  final dio = getIt<DioManager>();

  @override
  void initState() {
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

  Future<String> getEmailFromPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString(AppStrings.EMAIL);
    email ??= "";
    return email;
  }

  Future<void> deleteAccount(bool newsletter) async {
    try {
      final email = await getEmailFromPref();
      DeleteAccountRequest req = DeleteAccountRequest();
      req.email = email;
      req.newsLetterSubscribe = newsletter;
      final data = req.toJson();
      print(jsonEncode(data));
      final resp = await dio.post("/auth/delete", data: data);

      if (resp.statusCode == 200) {
        print("success --> ");
      } else {
        print("failure --> ");
      }

    } on SocketException catch (e) {
      print("Internet connection failed");
    } on DioError catch (e) {
      print("Something went wrong. Please try again later.");
    } catch (e) {
      print("Server Error, Something went wrong. Please try again later. " +
          e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    "Delete Account",
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
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: SingleChildScrollView(
      //       controller: scrollController,
      //       child: Column(
      //         children: [
      //           const SizedBox(height: 30,),
      //           Row(
      //             children: [
      //               Container(
      //                 width: 70,
      //                 height: 70,
      //                 child: const CircleAvatar(
      //                   radius: 48, // Image radius
      //                   backgroundImage: AssetImage(ImageAssets.userCircle),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 24.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text("Name",  style: Theme.of(context).textTheme.subtitle1,),
      //                     const SizedBox(height: 10,),
      //                     Text("Member Since",  style: Theme.of(context).textTheme.subtitle1,),
      //                     const SizedBox(height: 10,),
      //                     Text("Location",  style: Theme.of(context).textTheme.subtitle1,),
      //                   ],
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 24.0),
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text("",  style: Theme.of(context).textTheme.subtitle1,),
      //                     const SizedBox(height: 10,),
      //                     Text("01 Jan 2024",  style: Theme.of(context).textTheme.subtitle2,),
      //                     const SizedBox(height: 10,),
      //                     Text("Miami, Florida",  style: Theme.of(context).textTheme.subtitle2,),
      //                   ],
      //                 ),
      //               )
      //
      //             ],
      //           ),
      //           const SizedBox(height: 40,),
      //           const Text("Enter your password to delete your Ecostance account.*", style: TextStyle(
      //             fontSize: 14
      //           ),),
      //           const SizedBox(height: 30,),
      //           Form(
      //             key: formKey['password'],
      //             child: InputField(
      //               inputFormatters: [
      //                 FilteringTextInputFormatter.deny(
      //                     RegExp(' ')),
      //               ],
      //               label: "Password",
      //               suffixIcon: Icons.remove_red_eye,
      //               textEditingController:
      //               _passwordEditingController,
      //               obscureText: true,
      //               inputType: TextInputType.text,
      //               errorText: 'Enter a valid password',
      //               hintText: "Password",
      //               validator: (val) {
      //                 if (val!.isEmpty) {
      //                   return 'Enter Valid Password';
      //                 }
      //                 return null;
      //               },
      //               onUnfocused: () => formKey['password']
      //                   ?.currentState
      //                   ?.validate(),
      //               focusNode: nodes['password'],
      //               onFocused: () {},
      //             ),
      //           ),
      //           const SizedBox(height: 10,),
      //           const Row(
      //             children: [
      //               Text("Forgot Password?", style: TextStyle(
      //                   fontSize: 12,
      //                 color: Colors.black
      //               ),),
      //               SizedBox(width: 10,),
      //               Text(
      //                 'Request Password Reset',
      //                 style: TextStyle(
      //                   decoration: TextDecoration.underline,
      //                     fontSize: 12,
      //                     color: Colors.black
      //                 ),
      //               )
      //             ],
      //           ),
      //           const SizedBox(height: 40,),
      //           Text("Lorem ipsum some text will appear here lorem ipsum some text will appear here ", style: TextStyle(
      //               fontSize: 14,
      //               color: Colors.red.shade900
      //           ),),
      //           const SizedBox(height: 40,),
      //           AppButton2(
      //             onTap: () {
      //               for (var element in formKey.entries) {
      //                 if (!element.value.currentState!
      //                     .validate()) {
      //                   scrollController.jumpTo(scrollController
      //                       .position.minScrollExtent);
      //                   nodes[element.key]?.requestFocus();
      //
      //                   return;
      //                 }
      //               }
      //
      //             },
      //             text: Text("Continue",
      //                 style:
      //                 Theme.of(context).textTheme.headline2),
      //             filled: true,
      //             height: 60.h,
      //             feedbackTimeText: Text("Continue",
      //                 style: Theme.of(context)
      //                     .textTheme
      //                     .headline2
      //                     ?.copyWith(
      //                     color:
      //                     AppColors.primaryActiveColor)),
      //             isLoading: false,
      //             filledColor: _passwordEditingController.text.isNotEmpty ? Colors.black : Colors.grey,
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: ssas(),

    );
  }

  void _showSnackBar(BuildContext context, LoginState state) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.snackMessage ?? ''),duration: const Duration(seconds: 4),),);
    Future.delayed(const Duration(seconds: 4),(){
      BlocProvider.of<LoginBloc>(context).add(
          const LoginEvent.setSnackBar(
              showSnackBar: false, snackMessage: ''));
    });

  }

  void _onLogin(BuildContext context) async {
    // if (blockedMail == _userNameEditingController.text.trim() &&
    //     failedAttempts >= 8) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: getAttemtBasedMessage(failedAttempts)));
    //   return;
    // }
    BlocProvider.of<LoginBloc>(context).add(LoginEvent.loginButtonPressed(
        loginRequest: LoginRequest(
            password: _passwordEditingController.text,
            userId: "ram.mahender@gmail.com",
            strategy: "password")));
  }

  Widget ssas(){
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (prev, curr) =>
      curr.loginCurrentPage == LoginCurrentPage.loginPage,
      listener: (context, state) {
        // if (state.loginStatus == LoginStatus.success) {
        //   Navigator.pop(context, VerifyStatusEum.VERIFIED);
        //   return;
        // }
        // if (state.loginStatus == LoginStatus.unVerified) {
        //
        //   BlocProvider.of<LoginBloc>(context).add(const LoginEvent.setPage(
        //       loginCurrentPage: LoginCurrentPage.initial));
        //
        //   BlocProvider.of<LoginBloc>(context).add(
        //       const LoginEvent.setSnackBar(
        //           showSnackBar: false, snackMessage: ''));
        //
        //   regRepository.resendOtp(state.authDataModal!.user.email);
        //
        //   Navigator.pushNamed(context, Routes.screenRegistrationEnterOtp,
        //       arguments: OtpVerificationArguments(
        //           state.authDataModal!.user.email, Routes.loginRoute))
        //       .then((value) {
        //     BlocProvider.of<LoginBloc>(context)
        //         .add(const LoginEvent.setToIntital());
        //     Navigator.pop(context, value);
        //   });
        //   return;
        // }

        // if (state.loginStatus == LoginStatus.failed &&
        //     state.showASnackBar == true) {
        //
        //   if (state.snackMessage != null) {
        //     if (state.snackMessage!.toLowerCase().contains("wrong email")) {
        //       failedAttempts += 1;
        //     }
        //   }
        //   _showSnackBar(context, state);
        //
        //   // Future.delayed(const Duration(seconds: 10), () {
        //   //   ScaffoldMessenger.of(context).removeCurrentSnackBar();
        //   // });
        //   // Future.delayed(Duration(seconds: 5), () {
        //   //   BlocProvider.of<LoginBloc>(context).add(
        //   //       const LoginEvent.setSnackBar(
        //   //           showSnackBar: false, snackMessage: ''));
        //   // });
        // }


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
            body: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: const CircleAvatar(
                          radius: 48, // Image radius
                          backgroundImage: AssetImage(ImageAssets.userCircle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name",  style: Theme.of(context).textTheme.subtitle1,),
                            const SizedBox(height: 10,),
                            Text("Member Since",  style: Theme.of(context).textTheme.subtitle1,),
                            const SizedBox(height: 10,),
                            Text("Location",  style: Theme.of(context).textTheme.subtitle1,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("",  style: Theme.of(context).textTheme.subtitle1,),
                            const SizedBox(height: 10,),
                            Text("01 Jan 2024",  style: Theme.of(context).textTheme.subtitle2,),
                            const SizedBox(height: 10,),
                            Text("Miami, Florida",  style: Theme.of(context).textTheme.subtitle2,),
                          ],
                        ),
                      )

                    ],
                  ),
                  const SizedBox(height: 40,),
                  const Text("Enter your password to delete your Ecostance account.*", style: TextStyle(
                      fontSize: 14
                  ),),
                  const SizedBox(height: 30,),
                  Form(
                    key: formKey['password'],
                    child: InputField(
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
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Text("Forgot Password?", style: TextStyle(
                          fontSize: 12,
                          color: Colors.black
                      ),),
                      SizedBox(width: 10,),
                      Text(
                        'Request Password Reset',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                            color: Colors.black
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Text("Lorem ipsum some text will appear here lorem ipsum some text will appear here ", style: TextStyle(
                      fontSize: 14,
                      color: Colors.red.shade900
                  ),),
                  const SizedBox(height: 40,),
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

                      // _onLogin(context);
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
        );
      },
    );
  }


}
