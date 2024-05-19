import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/single_product_page/bloc/product_details_bloc.dart';
import 'package:net_carbons/presentation/wish_list/bloc/wish_list_bloc.dart';
import 'package:net_carbons/presentation/wish_list/card.dart';

import '../resources/assets.dart';
import '../resources/route_manager.dart';

class WishListDrawer extends StatelessWidget {
  const WishListDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width * .9,
      child: SafeArea(
        child: SizedBox(
          width: width * .9,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Text('Wishlist',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor)),
                    const Spacer(),
                    IconButton(
                      icon: SvgPicture.asset(SvgAssets.closeIcon),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: BlocBuilder<WishListBloc, WishListState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const CupertinoActivityIndicator();
                    }
                    final products = state.items;
                    return products.isNotEmpty
                        ? ListView.separated(
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return GestureDetector(
                                onTap: () {
                                  BlocProvider.of<ProductDetailsBloc>(context)
                                      .add(ProductDetailsEvent.started(
                                          productIds: state.items
                                              .map((e) => e.id)
                                              .toList()));
                                  Navigator.pushNamed(
                                    context,
                                    Routes.newProductDetailsScreen,
                                    arguments: {
                                      'products': state.items,
                                      'page': index
                                    },
                                  );
                                },
                                child: WishListTile(
                                  product: product.toProductCartModal(),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 5,
                              );
                            },
                            itemCount: products.length)
                        : const EmptyWishList();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({
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
              child: SvgPicture.asset(SvgAssets.favIcon)),
          SizedBox(
            height: 6.h,
          ),
          Text(
            "Empty Wishlist",
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
                'Add items to wishlist',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: AppColors.appWhite),
              ),
              feedbackTimeText: Text(
                'Add items to wishlist',
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
