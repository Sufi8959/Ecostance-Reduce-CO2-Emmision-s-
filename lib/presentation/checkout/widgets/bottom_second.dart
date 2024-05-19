import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/data/checkout/create_session_request_payload/item.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/domain/user_profile/modal/profile_modal.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/checkout/checkout_views/payment_page_view.dart';
import 'package:net_carbons/presentation/checkout/helper/checkoutHelper.dart';
import 'package:net_carbons/presentation/checkout/stripe_web/web_view.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cart/bloc/cart_bloc.dart';

class PaymentPageBottomSecondView extends StatefulWidget {
  const PaymentPageBottomSecondView(
      {Key? key, required this.currency, required this.pageController})
      : super(key: key);
  final String currency;
  final PageController pageController;

  @override
  State<PaymentPageBottomSecondView> createState() =>
      _PaymentPageBottomSecondViewState();
}

class _PaymentPageBottomSecondViewState
    extends State<PaymentPageBottomSecondView> {
  PaymentMode selectedPaymentMode = PaymentMode.payment;
  late SharedPreferences prefs;
  Response? checkoutSession;
  String? refId;

  @override
  void initState() {
    // if (widget.firstOrderGiftCoupon) {
    loadPrefs();
    // }
    super.initState();
  }

  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
    refId = prefs.getString('deep_link_data');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state) {
        print(state.isItemsLoading);
        return Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w),
              child: Column(
                children: [
                  RadioListTile<PaymentMode>(
                    visualDensity: const VisualDensity(horizontal: -4),
                    dense: true,
                    activeColor: AppColors.primaryActiveColor,
                    contentPadding: EdgeInsets.zero,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1 Time Payment:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AppColors.appGreyColor),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          'Pay '
                          '${getPriceFormattedWithCODE(widget.currency, state.orderTotal)} Today',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                      ],
                    ),
                    value: PaymentMode.payment,
                    groupValue: selectedPaymentMode,
                    onChanged: (val) {
                      setState(() {
                        checkoutSession = null;
                        selectedPaymentMode = val!;
                      });
                      print(checkoutSession);
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const Divider(height: 2, color: AppColors.lightGrey),
                  SizedBox(
                    height: 16.h,
                  ),
                  RadioListTile<PaymentMode>(
                    visualDensity: const VisualDensity(horizontal: -4),
                    dense: true,
                    activeColor: AppColors.primaryActiveColor,
                    contentPadding: EdgeInsets.zero,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '12 Subscription Payments of '
                          '${state.couponStateModal == null ? getPriceFormattedWithCODE(widget.currency, state.orderTotal / 12) : getPriceFormattedWithCODE(widget.currency, state.orderTotal / 12)} per month:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(color: AppColors.appGreyColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Pay '
                          '${state.couponStateModal == null ? getPriceFormattedWithCODE(widget.currency, (state.orderTotal / 12)) : getPriceFormattedWithCODE(widget.currency, state.orderTotal / 12)} Today',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                      ],
                    ),
                    value: PaymentMode.subscription,
                    groupValue: selectedPaymentMode,
                    onChanged: (val) {
                      setState(() {
                        checkoutSession = null;
                        selectedPaymentMode = val!;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: AppButton(
                      height: 60.h,
                      onTap: () {
                        // BlocProvider.of<CheckoutBloc>(
                        //         context)
                        //     .add(const CheckoutEvent
                        //         .done());
                        // Navigator.pop(context);
                        widget.pageController.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      text: Text(
                        ButtonStrings.back,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                      feedbackTimeText: Text(
                        ButtonStrings.back,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.appWhite),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: AppButton2(
                      isLoading: isPaying || state.isItemsLoading,
                      height: 60.h,
                      filled: true,
                      onTap: () async {
                        if (state.userProfile == null) {
                          return;
                        }
                        _pay(
                            context: context,
                            checkoutState: state,
                            billingAddressModal: state.billingAddress!,
                            paymentMode: selectedPaymentMode);
                      },
                      text: Text(
                        ButtonStrings.pay,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      feedbackTimeText: Text(
                        ButtonStrings.pay,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  bool isPaying = false;

  _pay(
      {required BuildContext context,
      required CheckoutState checkoutState,
      required BillingAddressModal billingAddressModal,
      required PaymentMode paymentMode}) async {
    // final createOrderRes =
    // await CheckoutHelper.createOrderAndRouteToTanksPageOnSuccessPayment(
    //     checkoutState, billingAddressModal, PaymentResult(sessionId: 'sdasdadsas', paymentStatus: PaymentStatus.success), paymentMode);
    // return;
    setState(() {
      isPaying = true;
    });
    if (checkoutState.orderTotalWithinStripeRange) {
      var createOrderRes;
      if (refId != null && refId!.isNotEmpty) {
        createOrderRes = await CheckoutHelper
            .createOrderAndRouteToTanksPageOnSuccessPaymentRefId(
                checkoutState,
                billingAddressModal,
                PaymentResult(
                  sessionId: '',
                  paymentStatus: PaymentStatus.success,
                ),
                paymentMode,
                refId!,
                null);
      } else {
        createOrderRes =
            await CheckoutHelper.createOrderAndRouteToTanksPageOnSuccessPayment(
                checkoutState,
                billingAddressModal,
                PaymentResult(
                  sessionId: '',
                  paymentStatus: PaymentStatus.success,
                ),
                paymentMode,
                null);
      }

      if (!mounted) return;
      createOrderRes.fold((l) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.message)));
        if (mounted) {
          setState(() {
            isPaying = false;
          });
        }
      },
          (r) => Navigator.pushReplacementNamed(context, Routes.orderThanks,
                  arguments: r)
              .then((value) => Navigator.pop(context)));
      return;
    }

    List<Item> items = CheckoutHelper.createItems(
        CartModal(
            cartQuantity: checkoutState.cartQuantity,
            cartTotal: checkoutState.cartTotal,
            products: checkoutState.products,
            discount: checkoutState.discount,
            subTotal: checkoutState.subTotal,
            orderTotal: checkoutState.orderTotal),
        paymentMode);

    if (checkoutSession == null) {
      await createCheckoutSession(
          items, billingAddressModal, checkoutState, paymentMode);
    }
    Future.delayed(Duration.zero, () async {
      if (checkoutSession == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unable to Initiate checkout")));
        setState(() {
          isPaying = false;
        });
        return;
      }

      PaymentResult? value = await showModalBottomSheet(
          enableDrag: false,
          isDismissible: false,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (sheetCtx) {
            return Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              height: MediaQuery.of(context).size.height * .93,
              child: CheckoutPage(
                url: checkoutSession?.data["session"]['url'] ?? '',
              ),
            );
          });
      if (value == null) {
        if (mounted) {
          setState(() {
            isPaying = false;
          });
        }
        return;
      }
      if (value.paymentStatus == PaymentStatus.success) {
        print(value.sessionId);
        var createOrderRes;
        if (refId != null && refId!.isNotEmpty) {
          createOrderRes = await CheckoutHelper
              .createOrderAndRouteToTanksPageOnSuccessPaymentRefId(
                  checkoutState,
                  billingAddressModal,
                  value,
                  paymentMode,
                  refId!,
                  checkoutSession?.data);
        } else {
          createOrderRes = await CheckoutHelper
              .createOrderAndRouteToTanksPageOnSuccessPayment(
                  checkoutState,
                  billingAddressModal,
                  value,
                  paymentMode,
                  checkoutSession?.data);
        }

        if (!mounted) return;
        createOrderRes.fold((l) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "Unable to create your order, Pleas contact customer support")));
          if (mounted) {
            setState(() {
              isPaying = false;
            });
          }
        }, (r) {
          if (checkoutState.checkoutType == CheckoutType.express &&
              checkoutState.newExpressItemSavedToCart) {
            BlocProvider.of<CartBloc>(context).add(CartEvent.alterItem(
                product: checkoutState.products.entries.first.value,
                action: AlterItemAction.delete));
          }
          Navigator.pushReplacementNamed(context, Routes.orderThanks,
                  arguments: r)
              .then((value) => Navigator.pop(context));
        });
      } else {
        if (mounted) {
          checkoutSession = null;
          setState(() {
            isPaying = false;
          });
        }
      }
    });
  }

  Future<void> createCheckoutSession(
      List<Item> items,
      BillingAddressModal billingAddressModal,
      CheckoutState checkoutState,
      PaymentMode paymentMode) async {
    final session = await CheckoutHelper.createSession(
        items,
        billingAddressModal,
        checkoutState.couponStateModal,
        paymentMode,
        checkoutState.userProfile!.user.email);

    session.fold((l) => setState(() => checkoutSession = null), (r) {
      setState(() {
        checkoutSession = r;
      });
    });
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    if (mounted) {
      super.setState(fn);
    }
  }
}
