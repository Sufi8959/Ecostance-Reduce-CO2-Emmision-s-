import 'dart:async';
import 'dart:io';

import 'package:animations/animations.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/utils/image_utils.dart';
import 'package:net_carbons/main.dart';
import 'package:net_carbons/notification/notification_helpers.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/calculate_page/bloc/calculate_bloc.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/layout_screen/widgets/bottom_bar.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/onboarding/share_experiments.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';

import '../../app/auth/auth_bloc.dart';
import '../../notification/scheduled_notification.dart';
import '../calculate_page/calculate_page.dart';
import '../resources/color.dart';

class ScreenChooseAction extends StatefulWidget {
  ScreenChooseAction({super.key});

  @override
  State<ScreenChooseAction> createState() => _ScreenChooseActionState();
}

class _ScreenChooseActionState extends State<ScreenChooseAction> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String getGreeting() {
    var hour = DateTime.now().hour;
    if (hour < 12 && hour > 2) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  void registerFirebaseMessaging() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  bool firstBuild = true;
  @override
  void initState() {
    super.initState();
    registerFirebaseMessaging();
  }

  bool onFeedback1 = false;
  bool onFeedback2 = false;
  swapToFeedback() {
    invertFeedbackValue();
    backToNormal();
  }

  void invertFeedbackValue() {
    if (mounted) {
      setState(() {
        onFeedback1 = !onFeedback1;
      });
    }
  }

  void backToNormal() {
    Future.delayed(const Duration(milliseconds: 100), () {
      invertFeedbackValue();
    });
  }

  swapToFeedback2() {
    invertFeedbackValue2();
    backToNormal2();
  }

  void invertFeedbackValue2() {
    if (mounted) {
      setState(() {
        onFeedback2 = !onFeedback2;
      });
    }
  }

  void backToNormal2() {
    Future.delayed(const Duration(milliseconds: 100), () {
      invertFeedbackValue2();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement initState+
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.started());
    //BlocProvider.of<CalculateBloc>(context).add(const CalculateEvent.started());
    BlocProvider.of<ProductsBloc>(context).add(const ProductsEvent.started());
    BlocProvider.of<CartBloc>(context).add(const CartEvent.cartStarted());
    return BlocBuilder<AppControllerBloc, AppControllerState>(
      buildWhen: (c, p) => firstBuild,
      builder: (context, appState) {
        return BlocConsumer<UserProfileBloc, UserProfileState>(
          listenWhen: (p, c) => false,
          listener: (context, state) {
            firstBuild = false;
            if (state.userProfileModal == null) {
              BlocProvider.of<UserProfileBloc>(context)
                  .add(const UserProfileEvent.fetchProfile());

              return;
            }
          },
          builder: (context, state) {
            // if(state.userProfileModal != null){
            //   if(state.userProfileModal!.calculationsResponseModal != null){
            //     BlocProvider.of<CalculateBloc>(context).add(
            //         CalculateEvent.addEmissionTOState(
            //             state.userProfileModal!.calculationsResponseModal!));
            //   }
            //
            // }

            final name = state.userProfileModal?.billingAddress != null
                ? "${state.userProfileModal?.billingAddress?.firstName} ${state.userProfileModal?.billingAddress?.lastName}"
                : state.userProfileModal?.user.email;

            return Scaffold(
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      height: 410.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(ImageAssets.bear1)),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 11.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<AuthBloc, AuthState>(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      HapticFeedback.heavyImpact();
                                      Navigator.pushNamed(
                                          context, Routes.quoteScreen);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 22,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Transform.scale(
                                  scale: 1.3, child: const LogoBar()),
                              const Opacity(
                                opacity: 0,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 28,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 370.h,
                      left: -MediaQuery.of(context).size.height * .05,
                      right: -MediaQuery.of(context).size.height * .05,
                      bottom: 373.h,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipOval(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 2,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                                left:
                                    (MediaQuery.of(context).size.height * .05) +
                                        22,
                                top: -16,
                                child: SizedBox(
                                    width: 58.h,
                                    height: 58.h,
                                    child: HomeProfileImage(
                                      profileImage: state
                                          .userProfileModal?.user.profileImage,
                                    )))
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hello, ${name ?? ''}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                        height: 1.6,
                                        color: AppColors.primaryActiveColor)),
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              getGreeting(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(height: 1.15),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            _OpenContainerWrapper(
                              closedChild: Container(
                                decoration: BoxDecoration(
                                    color: onFeedback1
                                        ? const Color(0XFF698F63)
                                        : const Color(0XFFDAEAE6),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 5),
                                        blurRadius: 18,
                                        color: Color.fromRGBO(0, 0, 0, .16),
                                      )
                                    ]),
                                height: 94.h,
                                width: double.maxFinite,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: SizedBox(
                                        height: 94.h,
                                        child: Image.asset(
                                          onFeedback1
                                              ? ImageAssets.bearButton1_1
                                              : ImageAssets.bearButton1,
                                          height: 94.h,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 83.w,
                                      child: Center(
                                        child: Text(
                                          "Calculate my carbon footprint",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                color: onFeedback1
                                                    ? AppColors.appWhite
                                                    : AppColors
                                                        .primaryActiveColor,
                                                height: 1.7,
                                                fontSize: 15.sp,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onClosed: () {
                                calculatorSelectedPageNotifier.value = 0;
                              },
                              onLongPress: () {
                                setState(() {
                                  onFeedback1 = true;
                                });
                              },
                              onLongPressCancel: () {
                                setState(() {
                                  onFeedback1 = false;
                                });
                              },
                              onLongPressEnd: (details) {
                                invertFeedbackValue();
                              },
                              onTap: () {
                                swapToFeedback();

                                Future.delayed(
                                    const Duration(milliseconds: 500), () {
                                  selectedIndexNotifier.value = 1;
                                });
                              },
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            _OpenContainerWrapper(
                              onClosed: () {},
                              onLongPress: () {
                                setState(() {
                                  onFeedback2 = true;
                                });
                              },
                              onLongPressCancel: () {
                                setState(() {
                                  onFeedback2 = false;
                                });
                              },
                              onLongPressEnd: (details) {
                                invertFeedbackValue2();
                              },
                              onTap: () {
                                swapToFeedback2();
                                selectedIndexNotifier.value = 0;
                              },
                              closedChild:
                                  ClosedChild(onFeedback2: onFeedback2),
                            ),
                            SizedBox(
                              height: 94.h,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  bool containerOpend = false;
}

class ClosedChild extends StatelessWidget {
  const ClosedChild({
    super.key,
    required this.onFeedback2,
  });

  final bool onFeedback2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:
              onFeedback2 ? const Color(0XFF6890AF) : const Color(0XFFEFF8FF),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 18,
              color: Color.fromRGBO(0, 0, 0, .16),
            )
          ]),
      height: 94.h,
      width: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: SizedBox(
              height: 94.h,
              child: Image.asset(
                onFeedback2
                    ? ImageAssets.bearButton2_1
                    : ImageAssets.bearButton2,
                height: 94.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 9.w,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 82.w,
            right: 10.w,
            child: Center(
              child: Text(
                "Select carbon reducing products",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: onFeedback2
                        ? AppColors.appWhite
                        : AppColors.primaryActiveColor,
                    height: 1.7,
                    fontSize: 15.sp),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    required this.closedChild,
    required this.onClosed,
    required this.onTap,
    required this.onLongPress,
    required this.onLongPressCancel,
    required this.onLongPressEnd,
  });

  final Widget closedChild;
  final void Function() onClosed;
  final Function onTap;
  final Function onLongPress;
  final Function onLongPressCancel;
  final Function(LongPressEndDetails details) onLongPressEnd;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OpenContainer(
      onClosed: (_) => onClosed(),
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 1000),
      openBuilder: (context, closedContainer) {
        return const MainScreen();
      },
      openColor: theme.cardColor,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedElevation: 0,
      closedColor: theme.cardColor,
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onLongPress: () => onLongPress(),
          onLongPressCancel: () => onLongPressCancel(),
          onLongPressEnd: onLongPressEnd,
          onTap: () {
            onTap();
            openContainer();
          },
          child: closedChild,
        );
      },
    );
  }
}

class HomeProfileImage extends StatefulWidget {
  const HomeProfileImage({
    Key? key,
    this.profileImage,
  }) : super(key: key);
  final String? profileImage;

  @override
  State<HomeProfileImage> createState() => _HomeProfileImageState();
}

class _HomeProfileImageState extends State<HomeProfileImage> {
  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<UserProfileBloc>(context);
    return GestureDetector(
      onTap: () async {
        if (BlocProvider.of<AuthBloc>(context).state is Authenticated) {
          await _selectImage(context).then((value) async {
            if (value != null) {
              final image = await ImageUtils.cropImage(value.path);
              if (image != null) {
                setState(() {
                  selectedImage = image;
                });
              }
              bloc.add(UserProfileEvent.saveMyProfile(data: {
                'profileImage': selectedImage != null
                    ? MultipartFile.fromFileSync(selectedImage!.path,
                        filename: selectedImage?.path.toString(),
                        contentType: MediaType('image', 'png'))
                    : '',
              }));
            }
          });
        } else {
          Navigator.pushNamed(context, Routes.loginRoute).then((value) {
            if (value is Authenticated ||
                value == VerifyStatusEum.VERIFIED ||
                value == VerifyStatusEum.AUTHENTICATED) {
              Navigator.pushReplacementNamed(
                  context, Routes.chooseActionScreen);
            } else {
              print("ELSWE");
            }
          });
        }
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.appGreyColor,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: selectedImage != null
                  ? FileImage(File(selectedImage!.path))
                  : null,
              foregroundImage: selectedImage == null
                  ? widget.profileImage != null
                      ? widget.profileImage!.isNotEmpty
                          ? NetworkImage(widget.profileImage!)
                          : null
                      : null
                  : null,
              radius: 27.r,
              child: selectedImage == null
                  ? Center(
                      child: SvgPicture.asset(
                      SvgAssets.cameraIcon,
                      fit: BoxFit.contain,
                      width: 24.w,
                      height: 22.h,
                    ))
                  : const SizedBox(),
            ),
          ),
          if (widget.profileImage != null && selectedImage != null)
            Positioned(
                right: 1,
                bottom: 1,
                child: CircleAvatar(
                  backgroundColor: AppColors.appGreyColor,
                  radius: 8.r,
                  child: CircleAvatar(
                    backgroundColor: AppColors.appWhite,
                    radius: 7.r,
                    child: SizedBox(
                      width: 7.w,
                      height: 7.w,
                      child: SvgPicture.asset(SvgAssets.cameraIcon),
                    ),
                  ),
                ))
        ],
      ),
    );
  }

  Future<XFile?> _selectImage(BuildContext context) async {
    final img = await ImageUtils.getImage(context);
    if (img == null) {
      return null;
    }
    final image = img as XFile;
    final size = await image.length();
    if (size > 2097152) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Image must be less than 2MB')));
        return null;
      }
    }
    return image;
  }
}
