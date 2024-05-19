import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/profile/child_screens/order/order_details.dart';
import 'package:net_carbons/presentation/profile/child_screens/settings/screen_settings.dart';
import 'package:net_carbons/presentation/profile/widgets/downloader.dart';
import 'package:net_carbons/presentation/profile/widgets/slektons.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../../../../app/dependency.dart';
import '../../../../data/user_profile/repository/repository.dart';
import '../../../../domain/user_profile/modal/my_orders_list.dart';
import '../../bloc/user_profile_bloc.dart';

class ScreenMyOrders extends StatelessWidget {
  ScreenMyOrders({Key? key}) : super(key: key);
  ScrollController scrollController = ScrollController();
  _setupScroll(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<UserProfileBloc>(context)
              .add(UserProfileEvent.fetchOrders());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setupScroll(context);
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.fetchOrders());
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<UserProfileBloc>(context)
            .add(const UserProfileEvent.setOrderListToInitial());

        return true;
      },
      child: Scaffold(
          appBar: buildAppAppBar(() {
            BlocProvider.of<UserProfileBloc>(context)
                .add(const UserProfileEvent.setOrderListToInitial());
            Navigator.pop(context);
          },
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(80.h),
                  child: Container(
                    color: AppColors.primaryInactive,
                    height: 41.h,
                    child: Center(
                      child: Text(
                        "My Orders",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: .5,
                            fontSize: 16,
                            color: AppColors.primaryActiveColor),
                      ),
                    ),
                  )),
              backgroundColor: AppColors.primaryInactive,
              hideWave: true),
          backgroundColor: AppColors.scaffoldColor,
          body: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              if (state.isOrdersLoading) {
                return const OrderListSkeleton();
              }

              if (state.myOrders.isEmpty) {
                return Center(
                  child: TextButton(
                      onPressed: () {
                        BlocProvider.of<UserProfileBloc>(context)
                            .add(const UserProfileEvent.fetchOrders());
                      },
                      child: const Text("Retry")),
                );
              }

              return ListView.separated(
                controller: scrollController,
                itemCount:
                    state.myOrders.length + (state.isOrdersMoreLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < state.myOrders.length) {
                    return OrderItem(
                      orderModal: state.myOrders[index],
                      dateFormat: 'yyyy-MM-dd',
                      key: Key(state.myOrders[index].id),
                    );
                  } else {
                    Future.delayed(const Duration(milliseconds: 30), () {
                      scrollController
                          .jumpTo(scrollController.position.maxScrollExtent);
                    });
                    return const CupertinoActivityIndicator();
                  }
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    color: AppColors.lightGrey,
                    height: 18.h,
                  );
                },
              );
            },
          )),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.orderModal,
    this.dateFormat = 'yyyy-MM-dd',
  }) : super(key: key);
  final OrderFetchModal orderModal;
  final String dateFormat;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.only(top: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.appGreyColor, width: 1),
          color: AppColors.appWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Order#: ",
                        style: textTheme.titleSmall
                            ?.copyWith(fontSize: 15.sp, color: Colors.black)),
                    TextSpan(
                        text: spaceFormatOrderNum(orderModal.orderNumber),
                        style: textTheme.titleSmall
                            ?.copyWith(fontSize: 15.sp, color: Colors.black)),
                  ]),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Date: ",
                        style: textTheme.titleSmall?.copyWith(
                            fontSize: 15.sp, color: AppColors.appGreyColor)),
                    TextSpan(
                        text: DateFormat('yyyy-MM-dd')
                            .format(orderModal.createdAt.toLocal()),
                        style: textTheme.titleSmall?.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.primaryActiveColor)),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Row(
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
                      mainText: Container(
                        padding: EdgeInsets.all(3.w),
                        child: Text(
                          'Order.pdf',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(fontSize: 15.sp, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Time: ",
                        style: textTheme.subtitle2?.copyWith(
                            fontSize: 15.sp, color: AppColors.appGreyColor)),
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
          ),
          Container(
            height: 23.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderModal.products[index].product.name,
                              style: textTheme.bodyText1,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                                (getPriceFormattedWithCODE(
                                        orderModal.currency,
                                        orderModal.products[index].price *
                                            orderModal
                                                .products[index].quantity))
                                    .toString(),
                                style: textTheme.bodyText1)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Wrap(
                        children: [
                          Text(
                            "${orderModal.products[index].quantity} x ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(color: AppColors.appGreyColor),
                          ),
                          Text(
                            getPriceFormattedWithCODE(orderModal.currency,
                                orderModal.products[index].price),
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                    ),
                          )
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, index) {
                  return Container(
                    height: 20.h,
                  );
                },
                itemCount: orderModal.products.length),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            margin: EdgeInsets.all(5.w),
            color: AppColors.orderPageGrayBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total items(s)',
                          style: Theme.of(context).textTheme.bodyText1),
                      Text('${orderModal.products.length}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  height: 18.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cart Total',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: AppColors.primaryActiveColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600)),
                      Text(
                          getPriceFormattedWithCODE(
                              orderModal.currency, orderModal.subTotal),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: AppColors.primaryActiveColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                const Divider(
                  color: AppColors.lightGrey,
                  thickness: 2,
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (orderModal.calculatedCouponDiscount > 0)
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Promotion",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 6.w),
                                  child: Text(
                                    orderModal.couponCode.isNotEmpty
                                        ? '(${orderModal.couponCode}) '
                                            '${orderModal.coupon.discountUnit}'
                                            '${orderModal.coupon.type == 'percentage' ? '%' : orderModal.coupon.discountUnit > 1 ? ' Free items' : ' Free item'}'
                                        : '',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ]),
                        ),
                        Text(
                          orderModal.couponCode.isNotEmpty
                              ? "-${getPriceFormattedWithCODE(orderModal.currency, orderModal.calculatedCouponDiscount)}"
                              : '0.00',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                SizedBox(
                  height: 18.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        getPriceFormattedWithCODE(orderModal.currency,
                            orderModal.calculatedCouponDiscount),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  height: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        getPriceFormattedWithCODE(orderModal.currency,
                            orderModal.calculatedCouponDiscount),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Divider(
                  color: AppColors.lightGrey,
                  thickness: 2,
                ),
                SizedBox(
                  height: 7.h,
                ),
                SizedBox(
                  height: 26.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order Total:",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: AppColors.primaryActiveColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                      Text(
                          getPriceFormattedWithCODE(
                              orderModal.currency, orderModal.orderTotal),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  color: AppColors.primaryActiveColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                AppButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenOrderDetails(
                                  orderModal: orderModal,
                                )));
                  },
                  text: Text(
                    "ORDER DETAILS",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  feedbackTimeText: Text(
                    "ORDER DETAILS",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: AppColors.primaryActiveColor),
                  ),
                  height: 43.h,
                  filled: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const String placeHolder =
      "https://i0.wp.com/www.gktoday.in/wp-content/uploads/2016/04/Product-in-Marketing.png";
}
