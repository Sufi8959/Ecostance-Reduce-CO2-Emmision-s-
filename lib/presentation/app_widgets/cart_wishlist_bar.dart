import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/wish_list/bloc/wish_list_bloc.dart';

class CartWishlistBar extends StatelessWidget {
  const CartWishlistBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, wishListState) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            return Builder(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: IconButton(
                      onPressed: () {
                        mainScaffold.currentState?.openDrawer();
                        Scaffold.of(context).openDrawer();
                      },
                      icon: SizedBox(
                        width: 30.h,
                        height: 40.h,
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(4.w),
                                  child: SvgPicture.asset(SvgAssets.favIcon)),
                              wishListState.items.isNotEmpty
                                  ? Positioned(
                                      right: 0.w,
                                      top: 0.w,
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.cherryRed,
                                        radius: 8.r,
                                        child: Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                                wishListState.items.length
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w800)),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: IconButton(
                      onPressed: () {
                        mainScaffold.currentState?.openEndDrawer();
                      },
                      icon: SizedBox(
                        width: 30.h,
                        height: 40.h,
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(4.w),
                                child: SvgPicture.asset(SvgAssets.cartIcon),
                              ),
                              cartState.cartQuantity == 0
                                  ? const SizedBox()
                                  : Positioned(
                                      right: 1.w,
                                      top: 0.w,
                                      child: CircleAvatar(
                                        backgroundColor: AppColors.cherryRed,
                                        radius: 8.r,
                                        child: Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                                cartState.cartQuantity
                                                    .toString(),
                                                overflow: TextOverflow.visible,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w800)),
                                          ),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
