import 'dart:ui';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/dependency.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/data/core/network/dio.dart';
import 'package:net_carbons/domain/user_profile/modal/my_orders_list.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/profile/child_screens/certificate.dart';
import 'package:net_carbons/presentation/profile/child_screens/order/cirtificate_web_view.dart';
import 'package:net_carbons/presentation/profile/child_screens/order/review_popup.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/profile/widgets/mange_sub_view.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../widgets/downloader.dart';

String link = "https://www.africau.edu/images/default/sample.pdf";

String bigFile =
    "https://file-examples.com/storage/feb2e515cc6339d7ba1ffcd/2017/04/file_example_MP4_1920_18MG.mp4";

class ScreenOrderDetails extends StatelessWidget {
  const ScreenOrderDetails({Key? key, required this.orderModal})
      : super(key: key);
  final OrderFetchModal orderModal;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.changePage(ProfileCurrPage.orderDetails));
    initializeDateFormatting();
    TextTheme textTheme = Theme.of(context).textTheme;

    List<OrderItem> items = List.generate(
        orderModal.products.length,
        (index) => OrderItem(
              product: orderModal.products[index],
              dateFormat: 'yyyy-MM-dd',
              currency: orderModal.currency,
              index: index,
              length: orderModal.products.length,
            ));
    return WillPopScope(
        onWillPop: () async {
          BlocProvider.of<UserProfileBloc>(context)
              .add(const UserProfileEvent.setOrderDetailsToInitial());
          return true;
        },
        child: BlocConsumer<UserProfileBloc, UserProfileState>(
          listenWhen: (p, c) =>
              c.profileCurrPage == ProfileCurrPage.orderDetails,
          listener: (context, state) {
            if (state.showASnackBar) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.snackMessage ?? 'Unknown Error')));
              BlocProvider.of<UserProfileBloc>(context)
                  .add(const UserProfileEvent.setSnackBar(false, ''));
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              progressIndicator: const CupertinoActivityIndicator(),
              inAsyncCall: state.cancelSubLoading ||
                  state.subscriptionStatus ==
                      CancelSubscriptionStatus.loading ||
                  state.isLoading,
              child: Scaffold(
                backgroundColor: AppColors.appWhite,
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
                              "Order details",
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
                body: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGrey)),
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Order#: ",
                                    style: textTheme.subtitle2?.copyWith(
                                        fontSize: 15.sp, color: Colors.black)),
                                TextSpan(
                                    text: spaceFormatOrderNum(
                                        orderModal.orderNumber),
                                    style: textTheme.subtitle2?.copyWith(
                                        fontSize: 15.sp, color: Colors.black)),
                              ]),
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Date: ",
                                    style: textTheme.subtitle2?.copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.appGreyColor)),
                                TextSpan(
                                    text: DateFormat('yyyy-MM-dd')
                                        .format(orderModal.createdAt.toLocal()),
                                    style: textTheme.subtitle2?.copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.primaryActiveColor)),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  SvgAssets.pdfIcon,
                                  color: AppColors.cherryRed,
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                DownloaderWidget(
                                  url: orderModal.invoice.filePath,
                                  fileName: orderModal.invoice.id,
                                  mainText: Text(
                                    'Order.pdf',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        ?.copyWith(
                                            fontSize: 15.sp,
                                            color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Time: ",
                                    style: textTheme.subtitle2?.copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.appGreyColor)),
                                TextSpan(
                                    text:
                                        "${DateFormat('HH:mm').format(orderModal.createdAt.toLocal())} ${orderModal.createdAt.toLocal().timeZoneName} (UTC${orderModal.createdAt.toLocal().timeZoneOffset.isNegative ? '-' : '+'}${orderModal.createdAt.toLocal().timeZoneOffset.inHours}:${orderModal.createdAt.toLocal().timeZoneOffset.inMinutes.remainder(60)})",
                                    style: textTheme.subtitle2?.copyWith(
                                        fontSize: 15.sp,
                                        color: AppColors.primaryActiveColor)),
                              ]),
                            ),
                          ],
                        ),
                        Container(
                          height: 9.h,
                        ),
                        Divider(
                          height: 4.h,
                          color: AppColors.appGreyColor,
                        ),
                        Container(
                          height: 10.h,
                        ),
                        Column(
                          children: items,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, top: 11.h, right: 15.w),
                          color: AppColors.orderPageGrayBg,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Order Total:",
                                    style: textTheme.headline2?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                    ),
                                  ),
                                  Text(
                                    getPriceFormattedWithCODE(
                                        orderModal.currency,
                                        orderModal.orderTotal),
                                    style: textTheme.headline2?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              SizedBox(height: 10.h),
                              if (orderModal.calculatedCouponDiscount > 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Discount applied: ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            color: AppColors.primaryActiveColor,
                                          ),
                                    ),
                                    Text(
                                      getPriceFormattedWithCODE(
                                          orderModal.currency,
                                          orderModal.calculatedCouponDiscount),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            color: AppColors.primaryActiveColor,
                                          ),
                                    ),
                                  ],
                                ),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total items: ",
                                    style: textTheme.bodyText1?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                      height: 1.4,
                                    ),
                                  ),
                                  Text(
                                    orderModal.products
                                        .fold(
                                            0,
                                            (int previousValue, element) =>
                                                previousValue +
                                                element.quantity)
                                        .toString(),
                                    style: textTheme.bodyText1?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                height: 1.h,
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                "Method: ${orderModal.paymentMethod}",
                                style: textTheme.bodyText1?.copyWith(
                                  color: AppColors.primaryActiveColor,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Payment type: ${orderModal.paymentMode == 'payment' ? 'One time payment' : 'Subscription'}",
                                style: textTheme.bodyText1?.copyWith(
                                  color: AppColors.primaryActiveColor,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                orderModal.paymentMode == 'subscription'
                                    ? orderModal.paymentLogModal.isNotEmpty
                                        ? "Total paid: ${getPriceFormattedWithCODE(orderModal.currency, (orderModal.paymentLogModal[0].amountTotal / 100))}"
                                        : ""
                                    : "Total paid: ${getPriceFormattedWithCODE(orderModal.currency, orderModal.orderTotal)}",
                                style: textTheme.bodyText1?.copyWith(
                                  color: AppColors.primaryActiveColor,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              if (orderModal.paymentMode == 'subscription')
                                Text(
                                  orderModal.paymentMode == 'subscription'
                                      ? orderModal.paymentLogModal.isNotEmpty
                                          ? "Payment remaining: ${getPriceFormattedWithCODE(orderModal.currency, ((12 - (orderModal.isSubscriptionCycleCompleted + 1)) * (orderModal.paymentLogModal[0].amountTotal / 100)))}"
                                          : ""
                                      : "Payment remaining: 0",
                                  style: textTheme.bodyText1?.copyWith(
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                              SizedBox(
                                height: 13.h,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 13.h,
                        ),

                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        if (orderModal.paymentMode == "subscription")
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Subscription Term",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                          color: AppColors.primaryActiveColor),
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  "Start date: ${DateFormat('yyyy-MM-dd').format(orderModal.createdAt.toLocal())}",
                                  style: textTheme.bodyText1?.copyWith(
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  "End date: ${DateFormat('yyyy-MM-dd').format(DateTime(orderModal.createdAt.year + 1, orderModal.createdAt.month, orderModal.createdAt.day).toLocal())}",
                                  style: textTheme.bodyText1?.copyWith(
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Text(
                                  "Monthly payment: ${getPriceFormattedWithCODE(orderModal.currency, (orderModal.orderTotal / 12))}",
                                  style: textTheme.bodyText1?.copyWith(
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        if (orderModal.paymentMode == "subscription" &&
                            orderModal.subscriptionCancelledAt == 0 &&
                            state.subscriptionStatus !=
                                CancelSubscriptionStatus.cancelledSuccess)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 19.h),
                                child: AppButton(
                                  height: 42.h,
                                  filled: false,
                                  onTap: () async {
                                    if (orderModal
                                            .isSubscriptionCycleCompleted !=
                                        1) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Subscription cannot be edited, try after 15 minutes')));
                                      // console.log alternative

                                      return;
                                    }
                                    // Future.delayed(const Duration(seconds: 2),
                                    //     () {

                                    // });
                                    await showCupertinoModalPopup(
                                        barrierDismissible: false,
                                        semanticsDismissible: true,
                                        context: context,
                                        builder: (ctx) {
                                          _showManageSubs(context, ctx);
                                          return const Center(
                                              child:
                                                  CupertinoActivityIndicator());
                                        });
                                  },
                                  text: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(SvgAssets.gear),
                                      SizedBox(
                                        width: 21.w,
                                      ),
                                      Text(
                                        'Manage Subscription',
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                color: AppColors
                                                    .primaryActiveColor),
                                      ),
                                    ],
                                  ),
                                  feedbackTimeText: Text(
                                    'Manage Subscription',
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: AppColors.appWhite),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: AppButton(
                                  height: 42.h,
                                  filled: true,
                                  onTap: () async {
                                    if (orderModal
                                            .isSubscriptionCycleCompleted !=
                                        1) {
                                      print(orderModal
                                          .isSubscriptionCycleCompleted);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Subscription cannot be cancelled, try after 15 minutes')));
                                      return;
                                    }
                                    // BlocProvider.of<UserProfileBloc>(context)
                                    //     .add(
                                    //   UserProfileEvent.cancelSubscription(
                                    //       "cs_test_a1Ft5dyslxyvw1I7PKMXkeeLhFQf88mVbTBs00RZbJNGmrIAOgAg7XP8Zd"),
                                    // );
                                    // cs_test_a1Ft5dyslxyvw1I7PKMXkeeLhFQf88mVbTBs00RZbJNGmrIAOgAg7XP8Zd
                                    // if (orderModal.paymentLogModal.isNotEmpty) {
                                    //   print(orderModal.paymentMode ==
                                    //           'subscription'
                                    //       ? orderModal
                                    //               .paymentLogModal.isNotEmpty
                                    //           ? orderModal.paymentLogModal[0].id
                                    //           : 'abc'
                                    //       : 'def');

                                    //   print(orderModal.toString());

                                    //   BlocProvider.of<UserProfileBloc>(context)
                                    //       .add(
                                    //     UserProfileEvent.cancelSubscription(
                                    //         orderModal.paymentLogModal[0].id),
                                    //   );
                                    // } else {
                                    //   print(orderModal.toString());
                                    //   print(orderModal.paymentMode ==
                                    //           'subscription'
                                    //       ? orderModal
                                    //               .paymentLogModal.isNotEmpty
                                    //           ? orderModal.paymentLogModal[0].id
                                    //           : 'abc'
                                    //       : 'def');
                                    //   // Handle the case when paymentLogModal is empty
                                    // }

                                    BlocProvider.of<UserProfileBloc>(context)
                                        .add(
                                            UserProfileEvent.cancelSubscription(
                                                orderModal
                                                    .paymentLogModal.first.id));
                                  },
                                  text: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.close,
                                        color: AppColors.appWhite,
                                      ),
                                      SizedBox(
                                        width: 21.w,
                                      ),
                                      Text(
                                        'Cancel Subscription',
                                        // orderModal
                                        //     .paymentLogModal[0].amountTotal
                                        //     .toString(),

                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                color: AppColors.appWhite),
                                      ),
                                    ],
                                  ),
                                  feedbackTimeText: Text(
                                    'Cancel Subscription',
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color:
                                                AppColors.primaryActiveColor),
                                  ),
                                ),
                              )
                            ],
                          ),
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                           Text(orderModal.isSubscriptionCycleCompleted.toString()),
//${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(orderModal.subscriptionCancelledAt))}
                        SizedBox(
                          height: 16.h,
                        ),
                        AppButton(
                          outlineColor: AppColors.greenBtn,
                          height: 42.h,
                          filled: true,
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      content: AddReviewPopUp(
                                          textTheme: textTheme,
                                          orderModal: orderModal),
                                    )).then((value) {
                              BlocProvider.of<UserProfileBloc>(context).add(
                                  const UserProfileEvent.setReviewToInitial());

                              BlocProvider.of<UserProfileBloc>(context).add(
                                  const UserProfileEvent.changePage(
                                      ProfileCurrPage.orderDetails));
                            });
                          },
                          text: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.edit_outlined,
                                color: AppColors.appWhite,
                              ),
                              SizedBox(
                                width: 21.w,
                              ),
                              Text(
                                'Write a Product Review',
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: AppColors.appWhite),
                              ),
                            ],
                          ),
                          filledColor: AppColors.greenBtn,
                          feedbackTimeText: Text(
                            'Write a Product Review',
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: AppColors.primaryActiveColor),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }

  _showManageSubs(BuildContext context, BuildContext modalCtx) async {
    try {
      // print(orderModal.toString());
      await getIt<DioManager>()
          .post('https://ecostance.marketsverse.com/api/get_stripeId',
              // '/v1/get-stripe-id',
              data: {
            "id":
                // "cs_test_a1Ft5dyslxyvw1I7PKMXkeeLhFQf88mVbTBs00RZbJNGmrIAOgAg7XP8Zd"
                orderModal.paymentLogModal.first.id
          }).then((value) {
        if (value.statusCode != 200) {
          print(value.statusCode);
          return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content:
                  Text('Unable to communicate with stripe, Try again later')));
        } else {
          return showCupertinoModalPopup(
                  context: context,
                  builder: (_) => Container(
                      padding: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      height: MediaQuery.of(context).size.height * .93,
                      child:
                          ManageSubsWebView(url: value.data['session']['url'])))
              .then((value) => Navigator.pop(modalCtx));
        }
      });
    } catch (e) {
      Navigator.pop(modalCtx);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Unable to communicate with stripe, Try again later')));
    }
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem(
      {Key? key,
      required this.product,
      required this.dateFormat,
      required this.currency,
      required this.index,
      required this.length})
      : super(key: key);
  final OrderProductElementModal product;
  final String dateFormat;
  final int index;
  final int length;
  final String currency;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
          // color: AppColors.lightGrey,
          border: index == length - 1
              ? null
              : const Border(
                  bottom: BorderSide(
                      color: Color.fromRGBO(218, 218, 218, 1), width: 1))),
      padding: EdgeInsets.only(bottom: 15.h, top: index == 0 ? 0 : 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ScreenCertificate(
              //               certId: product.certificateNumber,
              //             )));
              product.certificate.certificateURL.isNotEmpty
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CertificateWebView(
                                url: product
                                        .certificate.certificateURL.isNotEmpty
                                    ? product.certificate.certificateURL
                                    : 'https://www.africau.edu/images/default/sample.pdf',
                              )))
                  : null;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Certificate: ",
                  style: textTheme.headline2
                      ?.copyWith(color: AppColors.primaryActiveColor),
                ),
                Text(
                  spaceFormatOrderNum(product.certificate.originNumber),
                  style: textTheme.headline2
                      ?.copyWith(color: AppColors.primaryActiveColor),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SvgPicture.asset(SvgAssets.certificate)
              ],
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.r),
                  image: DecorationImage(
                      image: NetworkImage(product.product.image.first),
                      fit: BoxFit.cover),
                ),
                width: 109.h,
                height: 108.h,
              ),
              SizedBox(
                width: 11.w,
              ),
              Expanded(
                child: SizedBox(
                  height: 108.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.subtitle1?.copyWith(
                          color: AppColors.primaryActiveColor,
                        ),
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "${product.quantity} x ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 15.sp,
                                    color: AppColors.appGreyColor),
                          ),
                          Text(
                            getPriceFormattedWithCODE(currency, product.price),
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontSize: 15.sp,
                                      color: AppColors.primaryActiveColor,
                                    ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        getPriceFormattedWithCODE(
                            currency, product.price * product.quantity),
                        style: textTheme.headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          Text(
            product.product.shortDescription.length > 110
                ? "${product.product.shortDescription.substring(0, 110)}..."
                : product.product.shortDescription,
            style: textTheme.bodyText1?.copyWith(color: AppColors.appGreyColor),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

class DownloadTaskData {
  DownloadTaskData(
      {required this.downloadTaskStatus,
      required this.taskId,
      this.progress = 0});
  int progress;
  DownloadTaskStatus downloadTaskStatus;
  String taskId;
}

Future<bool> showPermissionPopup(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Storage Permission not Available"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx, false);
                },
                child: const Text('Ok! Cancel')),
            TextButton(
                onPressed: () {
                  Permission.storage.request();
                  Navigator.pop(ctx, true);
                },
                child: const Text('Allow Permission')),
          ],
        );
      });
}
