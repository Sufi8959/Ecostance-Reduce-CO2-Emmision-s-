import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import '../profile/bloc/user_profile_bloc.dart';
import 'checkout_views/address_page_view.dart';
import 'checkout_views/payment_page_view.dart';

class ScreenCheckout extends StatefulWidget {
  const ScreenCheckout({
    super.key,
  });

  @override
  State<ScreenCheckout> createState() => _ScreenCheckoutState();
}

class _ScreenCheckoutState extends State<ScreenCheckout> {
  @override
  void initState() {
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.fetchOrders());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<CheckoutBloc>(context)
            .add(const CheckoutEvent.cancelled());
        return true;
      },
      child: Scaffold(
        body: BlocConsumer<CheckoutBloc, CheckoutState>(
          listener: (context, checkOutState) {},
          builder: (context, checkOutState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (checkOutState.billingAddress != null) {
                if (!checkOutState.billingAddress!.isInvalid()) {
                  if (checkOutState.userProfile!.user.email.isNotEmpty) {
                    if (checkOutState.checkoutType == CheckoutType.express) {
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              pageBuilder: (_, __, ___) =>
                                  const ConfirmPaymentView(
                                    firstOrderGiftCoupon: false,
                                  ))).then((value) {});
                    }
                  }
                }
              }
            });

            if (checkOutState.userProfile != null) {
              return ModalProgressHUD(
                  progressIndicator: const CupertinoActivityIndicator(
                    color: Colors.amber,
                  ),
                  inAsyncCall:
                      checkOutState.isLoading || checkOutState.isCouponLoading,
                  child: InputAddressPageView(
                    profileModalData: checkOutState.userProfile!,
                    billingAddressModal: checkOutState.billingAddress,
                  ));
            }
            if (checkOutState.isItemsLoading || checkOutState.isLoading) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Oops!! Failed to load your profile",
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppButton(
                      filled: true,
                      text: Text(
                        "Reload",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: () {
                        BlocProvider.of<CheckoutBloc>(context)
                            .add(const CheckoutEvent.updateUser());
                      },
                      feedbackTimeText: Text(
                        "Reload",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppButton(
                      onTap: () {
                        BlocProvider.of<CheckoutBloc>(context)
                            .add(const CheckoutEvent.cancelled());
                        Navigator.pop(context);
                      },
                      text: Text(
                        "Go Back",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                      feedbackTimeText: Text(
                        "Go Back",
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.appWhite),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
