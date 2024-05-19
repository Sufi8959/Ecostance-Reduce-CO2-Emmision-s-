import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomPageViewFirst extends StatefulWidget {
  const BottomPageViewFirst(
      {Key? key,
      required this.pageController,
      required this.firstOrderGiftCoupon})
      : super(key: key);

  final bool firstOrderGiftCoupon;
  final PageController pageController;

  @override
  State<BottomPageViewFirst> createState() => _BottomPageViewFirstState();
}

class _BottomPageViewFirstState extends State<BottomPageViewFirst> {
  final GlobalKey<FormState> _couponFormKey = GlobalKey<FormState>();
  // late final SharedPreferences prefs;
  TextEditingController textEditingController = TextEditingController();
  late SharedPreferences prefs;
  int count = 1;

  @override
  void initState() {
    // if (widget.firstOrderGiftCoupon) {
      loadPrefs();
    // }
    super.initState();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    String? deep_link_data = prefs.getString('deep_link_data');
    checkCouponCode(deep_link_data);
  }

  void checkCoupon() {
    print("firstOrderGiftCoupon2 ---> ${widget.firstOrderGiftCoupon}");
    if (widget.firstOrderGiftCoupon == true) {
      textEditingController.text = "ED3VY7";

      // _couponFormKey.currentState?.validate();
      if (textEditingController.text.trim().isNotEmpty) {
        BlocProvider.of<CheckoutBloc>(context).add(CheckoutEvent.applyCoupon(
          code: textEditingController.text.trim(),
          checkoutType: CheckoutType.regular,
        ));
        prefs.setBool('gift_coupon', false);
      }
    }
  }

  void checkCouponCode(String? refId){
    if(refId != null && refId.isNotEmpty){
      textEditingController.text = "ED3VY7";
      if (textEditingController.text.trim().isNotEmpty) {
        BlocProvider.of<CheckoutBloc>(context).add(CheckoutEvent.applyCoupon(
          code: textEditingController.text.trim(),
          checkoutType: CheckoutType.regular,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        print(state.paymentCurrency);

        // if (widget.firstOrderGiftCoupon == true) {
        //   textEditingController.text = "ED3VY7";

        //   // print("count ---> $count");
        //   // if (count == 1) {
        //   _couponFormKey.currentState?.validate();
        //   if (textEditingController.text.trim().isNotEmpty) {
        //     // BlocProvider.of<CheckoutBloc>(context)
        //     //     .add(CheckoutEvent.applyCoupon(
        //     //   code: textEditingController.text.trim(),
        //     //   checkoutType: state.checkoutType,
        //     // ));

        //     // prefs.setBool('gift_coupon', false);
        //     // count == 2;
        //   }
        //   // }
        // }

        return Container(
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          height: 290.h,
          color: AppColors.orderPageGrayBg,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Add coupon",
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(height: 1.56),
              ),
              SizedBox(
                height: 3.h,
              ),
              state.couponStateModal != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 45.h,
                          child: Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 14.h,
                                    bottom: 14.h,
                                    left: 18.w,
                                    right: 11.w),
                                height: 45.h,
                                width: 157.w,
                                decoration: BoxDecoration(
                                    color: AppColors.appWhite,
                                    border: Border.all(
                                        width: 1, color: AppColors.lightGrey)),
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.couponStateModal!.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Transform.scale(
                                          scale: 1.6,
                                          child: SvgPicture.asset(
                                              SvgAssets.couponTickMark),
                                        )
                                      ],
                                    )),
                              ),
                              SizedBox(
                                width: 9.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Discount:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: AppColors.selectedGreen)),
                                  Text(
                                      getPriceFormattedWithCODE(
                                          state.paymentCurrency,
                                          state.discount),
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                              color: AppColors.selectedGreen))
                                ],
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Spacer(),
                              state.isCouponLoading
                                  ? CupertinoActivityIndicator()
                                  : SizedBox(
                                      width: 45.w,
                                      child: AppButton(
                                        outlineColor: AppColors.cherryRed,
                                        height: 45.h,
                                        onTap: () {
                                          BlocProvider.of<CheckoutBloc>(context)
                                              .add(CheckoutEvent.removeCoupon(
                                                  checkoutType:
                                                      state.checkoutType));
                                        },
                                        text: SvgPicture.asset(
                                            SvgAssets.deleteIcon),
                                        feedbackTimeText: SvgPicture.asset(
                                          SvgAssets.deleteIcon,
                                          color: AppColors.appWhite,
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                                "Cart Total: ${getPriceFormattedWithCODE(state.paymentCurrency, state.cartTotal)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor,
                                        height: 1.56)),
                            Text("Total items: ${state.cartQuantity}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor,
                                        height: 1.56)),
                            Text(
                              "Order Total: ${getPriceFormattedWithCODE(state.paymentCurrency, state.orderTotal)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                      height: 1.56),
                            ),
                          ],
                        )
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Form(
                            //autovalidateMode: AutovalidateMode.onUserInteraction,
                            key: _couponFormKey,
                            child: Row(
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      child: TextFormField(
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return 'Enter Valid Code';
                                          }
                                          return null;
                                        },
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                        controller: textEditingController,
                                        decoration:
                                            buildInputDecoration(context),
                                      ),
                                    )),
                                SizedBox(
                                  width: 19.w,
                                ),
                                SizedBox(
                                  width: 109.w,
                                  child: AppButton2(
                                    isLoading: state.isCouponLoading,
                                    height: 45.h,
                                    filled: true,
                                    onTap: () {
                                      _couponFormKey.currentState?.validate();
                                      if (textEditingController.text
                                          .trim()
                                          .isNotEmpty) {
                                        BlocProvider.of<CheckoutBloc>(context)
                                            .add(CheckoutEvent.applyCoupon(
                                          code:
                                              textEditingController.text.trim(),
                                          checkoutType: state.checkoutType,
                                        ));
                                        // prefs.setBool('gift_coupon', false);
                                      }
                                    },
                                    text: Text(
                                      "Apply",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(),
                                    ),
                                    feedbackTimeText: Text(
                                      "Apply",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(
                                              color:
                                                  AppColors.primaryActiveColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          state.couponHasError
                              ? Text("${state.couponMessage}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(color: AppColors.cherryRed))
                              : const SizedBox(),
                          SizedBox(
                            height: 4.h,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text("Total items:  ${state.cartQuantity}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                      height: 1.56)),
                          Text(
                            "Order Total : ${getPriceFormattedWithCODE(state.paymentCurrency, state.cartTotal)}",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    color: AppColors.primaryActiveColor,
                                    height: 1.56),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                height: 45.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.appGreyColor, width: .5)),
                child: DropdownButtonHideUnderline(
                  child: Row(
                    children: [
                      Text(
                        "Change currency",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          selectedItemBuilder: (BuildContext context) {
                            return BlocProvider.of<AppControllerBloc>(context)
                                .state
                                .currencyList
                                .map((currency) {
                              return Container();
                            }).toList();
                          },
                          isExpanded: true,
                          hint: Text(''),
                          alignment: AlignmentDirectional.center,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30.sp,
                          ),
                          value: state.paymentCurrency,
                          isDense: true,
                          onChanged: (newValue) {
                            BlocProvider.of<CheckoutBloc>(context).add(
                                CheckoutEvent.changeCurrency(
                                    newCurrency: newValue!));
                          },
                          items: BlocProvider.of<AppControllerBloc>(context)
                              .state
                              .currencyList
                              .map((currency) {
                            return DropdownMenuItem<String>(
                              value: currency.currencyCode,
                              child: Text(
                                "${currency.currencyCode}(${currency.currencySymbol})",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Hero(
                tag: 'addressPage',
                child: AppButton(
                  onTap: () {
                    widget.pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  text: Text(
                    'Next',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  filled: true,
                  height: 60.h,
                  feedbackTimeText: Text(
                    'Next',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.primaryActiveColor),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      fillColor: AppColors.appWhite,
      filled: true,

      contentPadding:
          EdgeInsets.only(left: 18.w, right: 18.w, top: 14.h, bottom: 14.h),
      hintStyle: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: AppColors.appGreyColor),
      hintText: "Type here",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: AppColors.lightGrey, width: 1.w),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide:
            BorderSide(color: AppColors.lightGrey.withOpacity(.5), width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: AppColors.lightGrey, width: 1.w),
      ),
      //error border
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: Colors.red, width: 1.w),
      ),
    );
  }
}
