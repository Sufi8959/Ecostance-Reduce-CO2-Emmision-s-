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
import '../../../../app/app_controller/app_controller_bloc.dart';
import '../../../../app/auth/auth_bloc.dart';
import '../../../../app/constants/string_constants.dart';
import '../../../../app/dependency.dart';
import '../../../../data/core/network/dio.dart';
import '../../../../data/login/repository/repository.dart';
import '../../../../domain/forgot_password/modal/resp_modal.dart';
import '../../../app_widgets/outlined_button.dart';
import '../../../app_widgets/text_input_field.dart';
import '../../../checkout/bloc/checkout_bloc.dart';
import '../../../login/bloc/login_bloc.dart';
import '../../../resources/route_manager.dart';
import '../../bloc/user_profile_bloc.dart';

class ScreenDeleteAccount extends StatefulWidget {
  ScreenDeleteAccount({Key? key}) : super(key: key);

  @override
  State<ScreenDeleteAccount> createState() => _ScreenDeleteAccountState();
}

class _ScreenDeleteAccountState extends State<ScreenDeleteAccount> {
  bool firstRun = true;
  bool firstRunLogin = true;
  String? name;
  String? email;
  String? location;

  final TextEditingController _passwordEditingController =
      TextEditingController();
  final Map<String, GlobalKey<FormState>> formKey = {
    "email": GlobalKey<FormState>(),
    "password": GlobalKey<FormState>(),
  };
  final Map<String, FocusNode> nodes = {
    "email": FocusNode(),
    "password": FocusNode(),
  };
  ScrollController scrollController = ScrollController();

  final dio = getIt<DioManager>();

  @override
  void initState() {
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.fetchProfile());
    super.initState();
  }

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
    return BlocBuilder<AppControllerBloc, AppControllerState>(
      builder: (context, appControllerBlocState) {
        return BlocConsumer<UserProfileBloc, UserProfileState>(
          listenWhen: (p, c) => p.saveProfileStatus != c.saveProfileStatus,
          listener: (context, state) {},
          builder: (context, state) {
            if (firstRun) {
              var userName =
                  "${state.userProfileModal?.user.firstName ?? ''} ${state.userProfileModal?.user.lastName ?? ''}";
              name = userName;
              location = state.userProfileModal?.addressCountry ?? '';
              email = state.userProfileModal?.user.email ?? '';
              firstRun = false;
            }

            return ModalProgressHUD(
                inAsyncCall: state.isLoading,
                progressIndicator: const CupertinoActivityIndicator(),
                child: Scaffold(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: .5,
                                        fontSize: 16,
                                        color: AppColors.primaryActiveColor),
                              ),
                            ),
                          )),
                      backgroundColor: AppColors.primaryInactive,
                      hideWave: true),
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  child: const CircleAvatar(
                                    radius: 48, // Image radius
                                    backgroundImage:
                                        AssetImage(ImageAssets.userCircle),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      // const SizedBox(height: 10,),
                                      // Text("Member Since",  style: Theme.of(context).textTheme.subtitle1,),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Location",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      // const SizedBox(height: 10,),
                                      // Text("01 Jan 2024",  style: Theme.of(context).textTheme.subtitle2,),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        location!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              "Enter your password to delete your Ecostance account.*",
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Form(
                              key: formKey['password'],
                              child: InputField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(' ')),
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
                            const SizedBox(
                              height: 10,
                            ),
                            BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                return Row(
                                  children: [
                                    const Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      child: const Text(
                                        'Request Password Reset',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                            color: Colors.black),
                                      ),
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            Routes.settingsChangePassword,
                                            arguments:
                                                OtpSubmitResponseModalSuccess(
                                                    token:
                                                        state is Authenticated
                                                            ? state
                                                                .authDataModal
                                                                .token
                                                            : ''));
                                      },
                                    )
                                  ],
                                );
                              },
                            ),
                            // const SizedBox(
                            //   height: 40,
                            // ),
                            // Text(
                            //   "Lorem ipsum some text will appear here lorem ipsum some text will appear here ",
                            //   style: TextStyle(
                            //       fontSize: 14, color: Colors.red.shade900),
                            // ),
                            const SizedBox(
                              height: 40,
                            ),
                            BlocConsumer<LoginBloc, LoginState>(
                              listener: (context, state) {
                                if (firstRunLogin) {
                                  print("isLoading ${state.isLoading}");
                                  print("loginStatus ${state.loginStatus}");
                                  if (state.loginStatus ==
                                      LoginStatus.success) {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return CustomDialog(email: email!);
                                        });
                                  }
                                  if (state.loginStatus == LoginStatus.failed &&
                                      state.showASnackBar == true) {
                                    _showSnackBar(context, state);
                                  }
                                  firstRunLogin == false;
                                }
                              },
                              builder: (context, state) {
                                return AppButton2(
                                  onTap: () {
                                    // for (var element in formKey.entries) {
                                    //   if (!element.value.currentState!
                                    //       .validate()) {
                                    //     scrollController.jumpTo(scrollController
                                    //         .position.minScrollExtent);
                                    //     nodes[element.key]?.requestFocus();
                                    //
                                    //     return;
                                    //   }
                                    // }
                                    // ScaffoldMessenger.of(context)
                                    //     .removeCurrentSnackBar();

                                    if (_passwordEditingController
                                        .text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Please enter password")));
                                    } else {
                                      // login(email!,
                                      //     _passwordEditingController.text);
                                      BlocProvider.of<LoginBloc>(context).add(
                                          LoginEvent.loginButtonPressed(
                                              loginRequest: LoginRequest(
                                                  password:
                                                      _passwordEditingController
                                                          .text,
                                                  userId: email!,
                                                  strategy: "password")));
                                    }
                                    // _onLogin(context);
                                  },
                                  text: Text(ButtonStrings.login,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2),
                                  filled: true,
                                  height: 60.h,
                                  feedbackTimeText: Text(ButtonStrings.login,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(
                                              color: AppColors
                                                  .primaryActiveColor)),
                                  isLoading: state.isLoading,
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          },
        );
      },
    );
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
}

class CustomDialog extends StatelessWidget {
  final email;
  const CustomDialog({super.key, required this.email});

  dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          const SizedBox(height: 24.0),
          Text(
            "Alert!\nAre you sure you want to delete your account?",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24.0),
          TextButton(
            onPressed: () {
              deleteAccount(context,email, false);
            },
            child: const Text(
              "Delete Account",
              style: TextStyle(
                  color: AppColors.redAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            onPressed: () {
              deleteAccount(context, email, true);
            },
            child: const Text(
              "Delete Newsletter Subscription Account",
              style: TextStyle(
                  color: AppColors.redAccent1,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              text:
                  Text("Dismiss", style: Theme.of(context).textTheme.headline2),
              filled: true,
              height: 60.h,
              feedbackTimeText: Text("Dismiss",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: AppColors.primaryActiveColor)),
            ),
          )
        ],
      ),
    );
  }

  Future<void> deleteAccount(BuildContext context, String email, bool newsletter) async {
    try {
      final dio = getIt<DioManager>();
      DeleteAccountRequest req = DeleteAccountRequest();
      req.email = email;
      req.newsLetterSubscribe = newsletter;
      final data = req.toJson();
      print(jsonEncode(data));
      final resp = await dio.post("/auth/delete", data: data);

      if (resp.statusCode == 200) {
        print("success --> ");
        BlocProvider.of<AuthBloc>(context)
            .add(const AuthEventLogoutRequested());
        BlocProvider.of<LoginBloc>(context).add(const LogoutRequested());
        BlocProvider.of<UserProfileBloc>(context)
            .add(const UserProfileEvent.reset());
        BlocProvider.of<CheckoutBloc>(context)
            .add(const CheckoutEvent.onLogout());
        BlocProvider.of<AppControllerBloc>(context).add(
            AppControllerEvent.updateCurrency(
                currency: BlocProvider.of<AppControllerBloc>(context)
                    .state
                    .countryModal
                    ?.currencyCode ??
                    'USD'));
        // Navigator.pop(context);
        Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute, (route) => false);
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
