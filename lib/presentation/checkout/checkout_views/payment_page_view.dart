import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/data/checkout/create_session_request_payload/item.dart';
import 'package:net_carbons/data/user_profile/order_fetch_response/order.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/checkout/helper/checkoutHelper.dart';
import 'package:net_carbons/presentation/checkout/stripe_web/web_view.dart';
import 'package:net_carbons/presentation/checkout/widgets/bottom_first.dart';
import 'package:net_carbons/presentation/checkout/widgets/bottom_second.dart';
import 'package:net_carbons/presentation/checkout/widgets/checkout_items_card.dart';
import 'package:net_carbons/presentation/checkout/widgets/overlay.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../calculate_page/bloc/calculate_bloc.dart';
import '../../profile/bloc/user_profile_bloc.dart';
import '../../resources/route_manager.dart';
import '../widgets/checkout_app_bar.dart';
import 'addMorePopup.dart';

class ConfirmPaymentView extends StatefulWidget {
  const ConfirmPaymentView({Key? key, required this.firstOrderGiftCoupon})
      : super(key: key);

  final bool firstOrderGiftCoupon;
  @override
  State<ConfirmPaymentView> createState() => _ConfirmPaymentViewState();
}

class _ConfirmPaymentViewState extends State<ConfirmPaymentView> {
  late PageController pageController = PageController();
  int bottomCurrentIndex = 0;

  // late SharedPreferences prefs;

  // bool firstOrderGiftCoupon = false;

  @override
  void initState() {
    // BlocProvider.of<UserProfileBloc>(context)
    //     .add(const UserProfileEvent.fetchOrders());

    pageController.addListener(() {
      if (pageController.page?.round() != bottomCurrentIndex) {
        setState(() {
          print("setState -->");
          bottomCurrentIndex = pageController.page?.round() ?? 0;
        });
      }
    });
    super.initState();

    // loadPrefs();
  }

  // Future<void> loadPrefs() async {
  //   prefs = await SharedPreferences.getInstance();

  //   bool? giftCoupon = prefs.getBool('gift_coupon');

  //   if (giftCoupon != null && giftCoupon == true) {
  //     firstOrderGiftCoupon = true;
  //     print("firstOrderGiftCoupon ---> $firstOrderGiftCoupon");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("build -->");
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        // if(state.products.isEmpty){
        //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //     Navigator.pop(context);
        //   });
        // }
      },
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (state.shouldShowEmissionPopup) {
            final calculateState =
                BlocProvider.of<CalculateBloc>(context).state;
            if (state.cartQuantity < calculateState.offsetValue) {
              Future.delayed(const Duration(seconds: 1), () {
                showAddMoreDialog(
                  mainCtx: context,
                  difference:
                      (calculateState.offsetValue - state.cartQuantity).toInt(),
                  totalAmount: calculateState.offsetValue.toInt(),
                );
              });
            }
          }
        });

        String currency = "USD ";
        if (state.products.isNotEmpty) {
          currency = state.paymentCurrency;
        }

        return Scaffold(
          backgroundColor: AppColors.appWhite,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.h),
            child: const CheckoutAppBar(
              title: 'Payment',
              actionText: '2/2 Checkout',
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: state.onSession
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(state.billingAddress?.toString() ?? ''),
                        Expanded(
                          child: state.products.isNotEmpty
                              ? ListView.separated(
                                  itemCount: state.products.length,
                                  itemBuilder: ((context, index) {
                                    final products = state.products.entries
                                        .map((e) => e.value)
                                        .toList();
                                    final product = products[index];
                                    return CheckoutListTile(
                                      currentQuantity: product.quantity,
                                      product: product,
                                    );
                                  }),
                                  separatorBuilder: (context, index) =>
                                      Divider(),
                                )
                              : const Center(
                                  child: Text('No Products'),
                                ),
                        ),

                        Container(
                          height: 341.h,
                          color: AppColors.orderPageGrayBg,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 8.r,
                                    backgroundColor: bottomCurrentIndex == 0.0
                                        ? AppColors.primaryActiveColor
                                        : AppColors.appButtonOutline,
                                  ),
                                  SizedBox(
                                    width: 7.w,
                                  ),
                                  CircleAvatar(
                                    radius: 8.r,
                                    backgroundColor: bottomCurrentIndex == 1.0
                                        ? AppColors.primaryActiveColor
                                        : AppColors.appButtonOutline,
                                  )
                                ],
                              ),
                              Expanded(
                                child: PageView(
                                  controller: pageController,
                                  children: [
                                    SizedBox(
                                      width: double.maxFinite,
                                      height: 323.h,
                                      child: BottomPageViewFirst(
                                          pageController: pageController,
                                          firstOrderGiftCoupon:
                                              widget.firstOrderGiftCoupon),
                                    ),
                                    SizedBox(
                                        width: double.maxFinite,
                                        height: 323.h,
                                        child: PaymentPageBottomSecondView(
                                          currency: currency,
                                          pageController: pageController,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(),
            ),
          ),
        );
      },
    );
  }
}

enum PaymentStatus { success, cancel }

enum PaymentMode { payment, subscription }
