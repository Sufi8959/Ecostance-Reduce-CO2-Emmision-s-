import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/main.dart';
import 'package:net_carbons/notification/notification_helpers.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/texts.dart';

import '../resources/route_manager.dart';

class ScreenVideo extends StatelessWidget {
  ScreenVideo({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();
  // AlertDialog
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance
        .getToken()
        .then((value) => textEditingController.text = value ?? '');
    return BlocConsumer<AppControllerBloc, AppControllerState>(
      listenWhen: (prevState, currState) => true,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.videoBg,
          body: Stack(
            children: [
              // Positioned(
              //     top: 100,
              //     child: Container(
              //       color: Colors.white,
              //       width: 320,
              //       child: Column(
              //         children: [
              //           TextField(
              //             maxLines: 10,
              //             controller: textEditingController,
              //           ),
              //           ElevatedButton(
              //               onPressed: () {
              //                 Clipboard.setData(ClipboardData(
              //                     text: textEditingController.text));
              //               },
              //               child: Text("copy"))
              //         ],
              //       ),
              //     )),
              Positioned(
                bottom: 69.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.quoteScreen);
                    },
                    child: Container(
                      color: AppColors.primaryActiveColor,
                      height: 60.h,
                      child: Center(
                          child: Text(
                        AppTexts.skip,
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: AppColors.appWhite,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Future<bool?> showExitDialogue(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            content: const Text("Do you want to exit the application?"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: const Text("No")),
              TextButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: const Text("Yes")),
            ],
          ));
}
