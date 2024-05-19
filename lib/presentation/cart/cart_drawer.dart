import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/main.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/calculate_page/bloc/calculate_bloc.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/cart/widgets/cart_card.dart';
import 'package:net_carbons/presentation/cart/widgets/cart_skelton.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/checkout/screen_you_are_not_signedin.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:page_transition/page_transition.dart';

import '../../app/auth/auth_bloc.dart';
import '../resources/assets.dart';
import '../resources/assets.dart';

class CartDrawer extends StatelessWidget {
  CartDrawer({super.key});

  TextEditingController textEditingController = TextEditingController();

  final _couponFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appc = BlocProvider.of<AppControllerBloc>(context).state;
    double width = MediaQuery.of(context).size.width;
    BlocProvider.of<CartBloc>(context).add(const CartEvent.calculateTotal());
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: AppColors.scaffoldColor,
          width: width * .9,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                width: width * .9,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26.w),
                      child: Row(
                        children: [
                          Text('Cart ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor)),
                          const Spacer(),
                          IconButton(
                            icon: SvgPicture.asset(SvgAssets.closeIcon),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                    !state.isLoading
                        ? state.products.isNotEmpty
                            ? ScrollConfiguration(
                                behavior: const ScrollBehavior(),
                                child: Expanded(
                                  child: NotificationListener<
                                      OverscrollIndicatorNotification>(
                                    onNotification:
                                        (OverscrollIndicatorNotification
                                            overscroll) {
                                      overscroll.disallowIndicator();
                                      return false;
                                    },
                                    child: ListView.separated(
                                        physics: ClampingScrollPhysics(),
                                        addSemanticIndexes: false,
                                        shrinkWrap: true,
                                        separatorBuilder: (context, i) =>
                                            Divider(
                                              height: 10.h,
                                            ),
                                        itemCount: state.products.length,
                                        itemBuilder: (context, index) {
                                          final products = state
                                              .products.entries
                                              .map((e) => e.value)
                                              .toList();
                                          final product = products[index];

                                          final currentQuantity =
                                              product.quantity;
                                          return CartListTile(
                                              product: product,
                                              currentQuantity: currentQuantity);
                                        }),
                                  ),
                                ),
                              )
                            : const EmptyCart()
                        : const CartSkeleton(),
                    !state.isLoading
                        ? CartBottom(
                            couponFormKey: _couponFormKey,
                            textEditingController: textEditingController,
                            state: state,
                          )
                        : const CartBottomSkeleton(),
                    SizedBox(
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CartBottom extends StatelessWidget {
  const CartBottom({
    Key? key,
    required GlobalKey<FormState> couponFormKey,
    required this.textEditingController,
    required this.state,
  })  : _couponFormKey = couponFormKey,
        super(key: key);

  final GlobalKey<FormState> _couponFormKey;
  final TextEditingController textEditingController;
  final CartState state;

  void _initiateCheckOut(
      BuildContext context, CartState state, AuthState authState) {
    BlocProvider.of<CheckoutBloc>(context)
        .add(const CheckoutEvent.started(checkoutType: CheckoutType.regular));

    if (authState is Authenticated) {
      if (authState.authDataModal.user.emailVerificationStatus !=
          VerifyStatusEum.VERIFIED.name) {
        Navigator.pushNamed(context, Routes.screenRegistrationEnterOtp,
                arguments: OtpVerificationArguments(
                    authState.authDataModal.user.email, Routes.checkoutScreen))
            .then((value) {
          if (value == VerifyStatusEum.VERIFIED) {
            Navigator.pushNamed(mainScaffold.currentContext ?? context,
                    Routes.checkoutScreen)
                .then((value) {
              Future.delayed(const Duration(seconds: 2), () {
                BlocProvider.of<CartBloc>(
                        mainScaffold.currentContext ?? context)
                    .add(const CartEvent.cartStarted());
              });
            });
          } else {
            Navigator.pop(context);
          }
        });
      } else if (authState.authDataModal.user.emailVerificationStatus ==
          VerifyStatusEum.VERIFIED.name) {
        Navigator.pushNamed(
                mainScaffold.currentContext ?? context, Routes.checkoutScreen)
            .then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            BlocProvider.of<CartBloc>(mainScaffold.currentContext ?? context)
                .add(const CartEvent.cartStarted());
          });
        });
      }
    } else {
      Navigator.push(
              context,
              PageTransition(
                  duration: const Duration(milliseconds: 2000),
                  type: PageTransitionType.scale,
                  alignment: Alignment.bottomCenter,
                  child: ScreenYouAreNotSignedIn()))
          .then((value) {
        if (value == VerifyStatusEum.VERIFIED) {
          BlocProvider.of<CheckoutBloc>(context)
              .add(const CheckoutEvent.updateUser());
          Navigator.pushNamed(
                  mainScaffold.currentContext ?? context, Routes.checkoutScreen)
              .then((value) {
            ///TODO: if error occures make to scaffold key
            Future.delayed(const Duration(seconds: 2), () {
              BlocProvider.of<CartBloc>(mainScaffold.currentContext ?? context)
                  .add(const CartEvent.cartStarted());
            });
          });
        } else {
          Navigator.pop(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = state.cartTotal;
    final currency = state.products.isNotEmpty
        ? state.products.entries.first.value.priceLocal?.currency ??
            state.products.entries.first.value.priceInUsd.currency
        : '';
    final unitOff = state.couponStateModal != null
        ? state.couponStateModal!.couponType == "percentage"
            ? "%"
            : "Unit"
        : '';

    return state.products.isNotEmpty
        ? Container(
            padding: EdgeInsets.only(left: 22.w, top: 14.h, right: 12.w),
            height: 290.h,
            color: AppColors.orderPageGrayBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text(
                //   "Add coupon",
                //   style: Theme.of(context).textTheme.subtitle1,
                // ),
                // SizedBox(
                //   height: 9.h,
                // ),
                state.couponStateModal != null
                    ? Column(
                        children: [
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 14.h,
                                        bottom: 14.h,
                                        left: 18.w,
                                        right: 11.w),
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.appWhite,
                                        border: Border.all(
                                            width: .5,
                                            color: AppColors.lightGrey)),
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
                                            SvgPicture.asset(
                                                SvgAssets.couponTickMark)
                                          ],
                                        )),
                                  )),
                              SizedBox(
                                width: 19.w,
                              ),
                              !state.isCouponLoading
                                  ? SizedBox(
                                      width: 114.w,
                                      child: AppButton(
                                        height: 45.h,
                                        onTap: () {
                                          BlocProvider.of<CartBloc>(context)
                                              .add(const CartEvent
                                                  .removeCoupon());
                                        },
                                        text: Text(
                                          "Remove",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: AppColors
                                                      .primaryActiveColor),
                                        ),
                                        feedbackTimeText: Text(
                                          "Remove",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: AppColors.appWhite),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      color: AppColors.primaryActiveColor,
                                      width: 114.w,
                                      height: 45.h,
                                      child: const Center(
                                          child: CupertinoActivityIndicator(
                                        color: AppColors.appWhite,
                                      )))
                            ],
                          ),
                        ],
                      )
                    : Container()
                //SingleChildScrollView(
                //  child: Form(
                // autovalidateMode: AutovalidateMode.onUserInteraction,
                //key: _couponFormKey,
                //child:
                //Row(
                //   textBaseline: TextBaseline.alphabetic,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Expanded(
                //         flex: 2,
                //         child: Container(
                //           height: 45.h,
                //           child: TextFormField(
                //             validator: (val) {
                //               if (val!.isEmpty) {
                //                 return 'Enter Valid Code';
                //               }
                //               return null;
                //             },
                //             style:
                //                 Theme.of(context).textTheme.bodyText1,
                //             controller: textEditingController,
                //             decoration: buildInputDecoration(context),
                //           ),
                //         )),
                //     SizedBox(
                //       width: 19.w,
                //     ),
                //     !state.isCouponLoading
                //         ? SizedBox(
                //             width: 109.w,
                //             child: AppButton(
                //               height: 45.h,
                //               filled: true,
                //               onTap: () {
                //                 final authState =
                //                     BlocProvider.of<AuthBloc>(context)
                //                         .state;

                //                 if (textEditingController.text
                //                     .trim()
                //                     .isNotEmpty) {
                //                   if (authState is Authenticated) {
                //                     BlocProvider.of<CartBloc>(context)
                //                         .add(CartEvent.applyCoupon(
                //                             textEditingController.text
                //                                 .trim()));
                //                   } else {
                //                     Navigator.pushNamed(
                //                         context,
                //                         Routes
                //                             .screenYouAreNotSignedIn);
                //                   }
                //                 }
                //               },
                //               text: Text(
                //                 "Apply",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .headline2
                //                     ?.copyWith(),
                //               ),
                //               feedbackTimeText: Text(
                //                 "Apply",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .headline2
                //                     ?.copyWith(
                //                         color: AppColors
                //                             .primaryActiveColor),
                //               ),
                //             ),
                //           )
                //         : Container(
                //             color: AppColors.primaryActiveColor,
                //             width: 109.w,
                //             height: 45.h,
                //             child: const Center(
                //                 child: CupertinoActivityIndicator(
                //               color: AppColors.appWhite,
                //             )))
                //   ],
                // ),
                // ),
                //  )
                ,
                state.couponHasError
                    ? Center(
                        child: Text(
                        state.couponMessage ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: AppColors.cherryRed),
                      ))
                    : const SizedBox(),
                Expanded(
                    child: state.couponStateModal != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Discount (${state.couponStateModal?.discountUnit.toStringAsFixed(0)}$unitOff): ${getPriceFormattedWithCODE(currency, state.discount)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: AppColors.selectedGreen,
                                          height: 1.3)),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                  "Cart Total: ${getPriceFormattedWithCODE(currency, state.subTotal)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: AppColors.primaryActiveColor,
                                          height: 1.3)),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Total Items: ${state.cartQuantity}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor,
                                        height: 1.56),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Order Total: ${getPriceFormattedWithCODE(currency, state.orderTotal)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor,
                                        height: 1.56),
                              ),
                              SizedBox(
                                height: 21.h,
                              )
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Total Items: ${state.cartQuantity}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor,
                                        height: 1.56),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "Order Total: ${state.subTotal.toInt() == 0 ? getPriceFormattedWithCODE(currency, state.cartTotal) : getPriceFormattedWithCODE(currency, state.subTotal)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor),
                              ),
                              SizedBox(
                                height: 9.h,
                              )
                            ],
                          )),
                Container(
                  child: BlocProvider.of<AuthBloc>(context).state
                          is Authenticated
                      ? AppButton(
                          onTap: () async {
                            if (state.isLoading) {
                              return;
                            }

                            if (state.products.isEmpty) {
                              return;
                            }
                            final authState =
                                BlocProvider.of<AuthBloc>(context).state;

                            _initiateCheckOut(context, state, authState);
                          },
                          text: Text(
                              BlocProvider.of<AuthBloc>(context).state
                                      is Authenticated
                                  ? ButtonStrings.checkout
                                  : "LOGIN TO CHECKOUT",
                              style: Theme.of(context).textTheme.headline2),
                          filled: true,
                          feedbackTimeText: Text(ButtonStrings.checkout,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor)),
                        )
                      : OpenContainer(
                          closedShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          transitionType: ContainerTransitionType.fadeThrough,
                          transitionDuration: const Duration(milliseconds: 300),
                          closedBuilder: (BuildContext ctx, openContainer) =>
                              AppButton(
                            onTap: () async {
                              if (state.isLoading) {
                                return;
                              }

                              if (state.products.isEmpty) {
                                return;
                              }
                              BlocProvider.of<CheckoutBloc>(context).add(
                                  const CheckoutEvent.started(
                                      checkoutType: CheckoutType.regular));
                              openContainer();
                            },
                            text: Text("LOGIN TO CHECKOUT",
                                style: GoogleFonts.workSans(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appWhite,
                                )),
                            filled: true,
                            feedbackTimeText: Text(ButtonStrings.checkout,
                                style: GoogleFonts.workSans(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryActiveColor,
                                )),
                          ),
                          openBuilder: (BuildContext ctx,
                              void Function({Object? returnValue}) action) {
                            return ScreenYouAreNotSignedIn(
                              ctx: ctx,
                            );
                          },
                          onClosed: (data) {
                            if (data == VerifyStatusEum.VERIFIED) {
                              Navigator.pushNamed(navigatorKey.currentContext!,
                                      Routes.checkoutScreen)
                                  .then((value) {
                                ///TODO: if error occures make to scaffold key
                                Future.delayed(const Duration(seconds: 1), () {
                                  BlocProvider.of<CartBloc>(
                                          mainScaffold.currentContext ??
                                              context)
                                      .add(const CartEvent.cartStarted());
                                });
                              });
                            } else {
                              ///TODO: if error occures make to scaffold key
                              // Navigator.pop(context);
                            }
                          },
                        ),
                )
              ],
            ),
          )
        : SizedBox();
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

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.appWhite,
          border: Border.all(width: 1, color: AppColors.appButtonOutline),
          borderRadius: BorderRadius.circular(12.r)),
      width: 334.w,
      height: 185.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 29.h,
          ),
          SizedBox(
              width: 53.w,
              height: 53.w,
              child: SvgPicture.asset(SvgAssets.emptyCart)),
          SizedBox(
            height: 6.h,
          ),
          Text(
            "Empty Cart",
            style: Theme.of(context).textTheme.subtitle2?.copyWith(height: 1.4),
          ),
          SizedBox(
            height: 22.h,
          ),
          SizedBox(
            width: 177.w,
            height: 32.h,
            child: AppButton(
              filled: true,
              onTap: () {
                Navigator.pop(context);
              },
              text: Text(
                'Go shop',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.appWhite),
              ),
              feedbackTimeText: Text(
                'Go shop',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.primaryActiveColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
