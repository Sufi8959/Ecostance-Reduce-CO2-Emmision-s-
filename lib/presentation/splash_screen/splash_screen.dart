import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/internet_bloc/internet_state.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/splash_screen/bloc/splash_bloc.dart';
import 'package:net_carbons/presentation/wish_list/bloc/wish_list_bloc.dart';

import '../profile/bloc/user_profile_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late SplashBloc splashBloc;
  late SplashState spashState;
  late AuthBloc authBloc;
  StreamController streamController = StreamController();
  @override
  void initState() {
    splashBloc = BlocProvider.of<SplashBloc>(context);
    authBloc = BlocProvider.of<AuthBloc>(context);
    streamController.addStream(BlocProvider.of<AuthBloc>(context).stream);
    print("initState  _SplashScreenState");
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();

    // BlocProvider.of<CartBloc>(context).add(const CartEvent.cartStarted());
    BlocProvider.of<WishListBloc>(context).add(const WishListEvent.started());

    // streamController.stream.listen((event) {
    //   if (event is Authenticated) {
    //
    //       Navigator.pushReplacementNamed(context, Routes.chooseActionScreen);
    //
    //   } else if (event is Unauthenticated) {
    //
    //       Navigator.pushReplacementNamed(context, Routes.videoScreen);
    //
    //   }
    // });

    initializeDateFormatting();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();

    super.dispose();
  }

  bool listenAuth = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, authState) {
        if (authState is Authenticated || authState is Unauthenticated) {
          if (authState is Authenticated) {
            Future.delayed(const Duration(seconds: 4), () {
              Navigator.pushReplacementNamed(
                  context, Routes.chooseActionScreen);
            });
          } else if (authState is Unauthenticated) {
            Future.delayed(Duration(seconds: 4), () {
              Navigator.pushReplacementNamed(context, Routes.quoteScreen);
            });
          }
          listenAuth = false;
        }
      },
      listenWhen: (p, c) => listenAuth,
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: AnimatedBuilder(
                animation: animation,
                builder: (BuildContext context, Widget? child) {
                  return Opacity(
                    opacity: animation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                            scale: .8,
                            child: SizedBox(
                                width: ScreenUtil().setWidth(400),
                                height: ScreenUtil().setHeight(400),
                                child: Image.asset(ImageAssets.splashLogo))),

                        // state.internetState is DisconnectedState
                        //     ? TextButton(
                        //         onPressed: () {}, child: const Text('Reload'))
                        //     : SizedBox(),
                        // state.authState is AuthLoading
                        //     ? const CupertinoActivityIndicator(
                        //         color: Colors.lightGreen,
                        //       )
                        //     : SizedBox(),
                        // AppOutlinedButton(
                        //     onTap: () {
                        //       _initApp();
                        //     },
                        //     text: const Text('Continue to app'))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  void _initApp(SplashState splashState) async {
    if (splashState.internetState is ConnectedState) {
      if (splashState.authState is AuthLoading) {
      } else if (splashState.authState is Unauthenticated) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, Routes.quoteScreen);
        }
      } else if (splashState.authState is Authenticated) {
        print("splashState.authState is Authenticated");
        BlocProvider.of<UserProfileBloc>(context)
            .add(const UserProfileEvent.started());

        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.chooseActionScreen, (r) => false);
        }
      }
    } else {
      showAboutDialog(context: context);
    }
  }

  void _initAppAuth(AuthState authState) async {
    if (authState is AuthLoading) {
    } else if (authState is Unauthenticated) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.videoScreen);
      }
    } else if (authState is Authenticated) {
      print("_initApp");
      BlocProvider.of<UserProfileBloc>(context)
          .add(const UserProfileEvent.started());
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.chooseActionScreen);
        //     .then((value) {
        //   Navigator.pushReplacementNamed(context, Routes.videoScreen);
        // });
      }
    }
  }
}

//
// BlocBuilder<AuthBloc, AuthState>(
// builder: (context, state) {
// if (state is Unauthenticated) {
// return const ScreenVideo();
// }
// if (state is Authenticated) {
// return const ScreenChooseAction();
// }
// if (state is AuthLoading) {
// return const Center(
// child: CupertinoActivityIndicator(
// backgroundColor: Colors.redAccent,
// ));
// }
//
// return const Center(
// child: CupertinoActivityIndicator(
// backgroundColor: Colors.amber,
// semanticsLabel: 'from main',
// ));
// },
// ),
