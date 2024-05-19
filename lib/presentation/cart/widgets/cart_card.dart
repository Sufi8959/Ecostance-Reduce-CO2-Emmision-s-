import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/app/app_controller/app_controller_bloc.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/cart_item_count_controller.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({
    Key? key,
    required this.product,
    required this.currentQuantity,
    this.fromWishList = false,
  }) : super(key: key);

  final ProductCartModal product;
  final int currentQuantity;
  final bool fromWishList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        padding:
            EdgeInsets.only(left: 20.w, top: 12.h, bottom: 12.h, right: 20.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.lightGrey)),
        height: 200.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: EdgeInsets.only(left: 8.w, bottom: 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              product.productModal.name,
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            PriceWrap(
                                currentQuantity: currentQuantity,
                                product: product),
                            const Expanded(child: SizedBox()),
                            Text(
                              getPriceFormattedWithCODE(
                                  product.priceLocal?.currency ??
                                      product.priceInUsd.currency,
                                  product.price * product.quantity),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.primaryActiveColor,
                                  ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            product.productModal.name.length < 12
                ? SizedBox(
                    height: 1.h,
                  )
                : SizedBox(
                    height: 5.h,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartItemCountTool(
                  iconSize: 24.sp,
                  height: 38.h,
                  currentQuanity: currentQuantity,
                  onDecrement: () {
                    BlocProvider.of<CartBloc>(context).add(CartEvent.alterItem(
                        product: product, action: AlterItemAction.decrement));
                  },
                  onIncrement: () {
                    BlocProvider.of<CartBloc>(context).add(CartEvent.alterItem(
                        product: product, action: AlterItemAction.increment));
                  },
                  width: 90.w,
                ),
                GestureDetector(
                    onTap: () {
                      BlocProvider.of<CartBloc>(context).add(
                        CartEvent.alterItem(
                            product: product, action: AlterItemAction.delete),
                      );
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

class PriceWrap extends StatelessWidget {
  const PriceWrap({
    Key? key,
    required this.currentQuantity,
    required this.product,
  }) : super(key: key);

  final int currentQuantity;
  final ProductCartModal product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${currentQuantity}x",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: AppColors.appGreyColor),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Text(
                "${product.priceLocal?.currency ?? product.priceInUsd.currency} ",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.appGreyColor,
                    ),
              ),
              Text(
                getPriceFormattedWithoutcode(
                    product.priceLocal?.currency ?? product.priceInUsd.currency,
                    product.productModal.priceLocal?.oldPrice ??
                        product.productModal.priceInUsd.oldPrice),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: AppColors.appGreyColor,
                    decoration: TextDecoration.lineThrough),
              ),
              Text(
                " / ${getPriceFormattedWithoutcode(product.priceLocal?.currency ?? product.priceInUsd.currency, product.price)}",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: AppColors.primaryActiveColor,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
