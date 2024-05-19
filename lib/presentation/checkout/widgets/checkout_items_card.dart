import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/cart_item_count_controller.dart';

class CheckoutListTile extends StatelessWidget {
  const CheckoutListTile({
    Key? key,
    required this.product,
    required this.currentQuantity,
  }) : super(key: key);

  final ProductCartModal product;
  final int currentQuantity;
  @override
  Widget build(BuildContext context) {
    final currency =
        product.priceLocal?.currency ?? product.priceInUsd.currency;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        padding:
            EdgeInsets.only(left: 20.w, top: 12.h, bottom: 12.h, right: 20.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.lightGrey)),
        height: 210.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 110.h,
                    height: 110.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                product.productModal.thumbImage.isNotEmpty
                                    ? product.productModal.thumbImage[0]
                                    : product.productModal.image[0]))),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding:
                            EdgeInsets.only(top: 12.h, left: 18.w, bottom: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              product.productModal.name.length < 20
                                  ? "${product.productModal.name} "
                                  : "${product.productModal.name.substring(0, 20)}...",
                              style: Theme.of(context).textTheme.subtitle1,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${product.quantity}x ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: AppColors.appGreyColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      getPriceFormattedWithCODE(
                                          currency,
                                          product.productModal.priceLocal
                                                  ?.oldPrice ??
                                              product.productModal.priceInUsd
                                                  .oldPrice),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: AppColors.appGreyColor,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                    ),
                                    Text(
                                      " / ${getPriceFormattedWithoutcode(currency, product.price)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            color: AppColors.primaryActiveColor,
                                          ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                getPriceFormattedWithCODE(
                                    currency, product.price * product.quantity),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        color: AppColors.primaryActiveColor,
                                        fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartItemCountTool(
                  iconSize: 24.sp,
                  height: 38.h,
                  currentQuanity: currentQuantity,
                  onDecrement: () {
                    BlocProvider.of<CheckoutBloc>(context).add(
                        CheckoutEvent.alterItem(
                            product: product,
                            action: AlterItemAction.decrement));
                  },
                  onIncrement: () {
                    BlocProvider.of<CheckoutBloc>(context).add(
                        CheckoutEvent.alterItem(
                            product: product,
                            action: AlterItemAction.increment));
                  },
                  width: 90.w,
                ),
                // SizedBox(height: 38.h,),
                GestureDetector(
                    onTap: () {
                      BlocProvider.of<CheckoutBloc>(context).add(
                          CheckoutEvent.alterItem(
                              product: product,
                              action: AlterItemAction.delete));
                    },
                    child: SvgPicture.asset(SvgAssets.deleteIcon))
              ],
            )
          ],
        ),
      ),
    );
  }
}
