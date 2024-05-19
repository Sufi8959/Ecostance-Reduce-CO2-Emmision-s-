import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';

import '../resources/color.dart';
import 'bloc/wish_list_bloc.dart';

class WishListTile extends StatelessWidget {
  const WishListTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductCartModal product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 26.w, top: 13.w),
      color: AppColors.appWhite,
      height: 185.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 108.h,
                height: 108.h,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(product.productModal.image[0]))),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          product.productModal.name.length < 20
                              ? product.productModal.name
                              : "${product.productModal.name.substring(0, 20)}...",
                          style: Theme.of(context).textTheme.subtitle1),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              ("${product.priceLocal?.currency ?? product.priceInUsd.currency} "),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor),
                            ),
                            Text(
                              getPriceFormattedWithoutcode(
                                  product.priceLocal?.currency ??
                                      product.priceInUsd.currency,
                                  product.priceLocal?.oldPrice ??
                                      product.priceInUsd.oldPrice),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: AppColors.appGreyColor,
                                      decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              " / ${getPriceFormattedWithoutcode(product.priceLocal?.currency ?? product.priceInUsd.currency, product.priceLocal?.price ?? product.priceInUsd.price)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor),
                            ),
                          ]),
                    ],
                  ))
            ],
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20.w, bottom: 20.w),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<WishListBloc>(context).add(
                          WishListEvent.removeItem(
                            product: product.productModal,
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.favorite,
                        color: AppColors.cherryRed,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
