import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/texts.dart';

import '../app_widgets/outlined_button.dart';
import '../resources/assets.dart';
import '../resources/route_manager.dart';
import 'bloc/checkout_bloc.dart';

class ScreenYouAreNotSignedIn extends StatelessWidget {
  ScreenYouAreNotSignedIn({Key? key,  this.ctx}) : super(key: key);
  bool buyNow = false;
  final BuildContext? ctx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  print("LSHAJDJK");
                  Navigator.pop(context,"HI IAM FROM SOME ");
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.primaryActiveColor,
                ),
              ),
              LogoBar(),
              Opacity(
                opacity: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: AppColors.primaryActiveColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.startScreenImage),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Image.asset(
                      ImageAssets.onBoardingSvg,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Please Login or Register to checkout",
                      // AppTexts.startScreenTitle,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      AppTexts.notLoggesScreenSubTitile,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    AppButton(
                      height: 60.h,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.registerRoute)
                            .then((value) {
                          BlocProvider.of<CheckoutBloc>(context)
                              .add(const CheckoutEvent.updateUser());
                          Navigator.pop(context, value);

                          // if (value == VerifyStatusEum.VERIFIED) {
                          //   Navigator.pop(context, value);
                          //   // Navigator.pushNamed(
                          //   //   context,
                          //   //   Routes.checkoutScreen,
                          //   // ).then((value) => Navigator.pop(context));
                          //
                          //   BlocProvider.of<CheckoutBloc>(context)
                          //       .add(const CheckoutEvent.updateUser());
                          // }
                        });
                      },
                      text: Text(
                        ButtonStrings.signUp,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      filled: true,
                      feedbackTimeText: Text(
                        ButtonStrings.signUp,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    AppButton(
                      height: 60.h,
                      onTap: () async {
                         Navigator.pushNamed(context, Routes.loginRoute)
                            .then((value) {

                          BlocProvider.of<CheckoutBloc>(context)
                              .add(const CheckoutEvent.updateUser());
                          Navigator.pop(ctx!,value);
                        });
                      },
                      text: Text(
                        ButtonStrings.login,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                      filled: false,
                      feedbackTimeText: Text(
                        ButtonStrings.login,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.appWhite),
                      ),
                    ),
                    SizedBox(
                      height: 69.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
