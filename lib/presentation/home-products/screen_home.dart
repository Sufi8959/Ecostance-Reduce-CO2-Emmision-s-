import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/presentation/app_widgets/cart_wishlist_bar.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';
import 'package:net_carbons/presentation/home-products/widgets/product_card.dart';
import 'package:net_carbons/presentation/home-products/widgets/skeleton.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/layout_screen/widgets/bottom_bar.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:net_carbons/presentation/single_product_page/bloc/product_details_bloc.dart';
import 'package:net_carbons/presentation/wish_list/bloc/wish_list_bloc.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

import '../resources/assets.dart';

GlobalKey<ScaffoldState> productPageScaffold = GlobalKey<ScaffoldState>();

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  ScrollController scrollController = ScrollController();
  _setupScroll(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          BlocProvider.of<ProductsBloc>(
                  productPageScaffold.currentContext ?? context)
              .add(ProductsEvent.fetchProducts());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductsBloc>(productPageScaffold.currentContext ?? context)
        .add(ProductsEvent.started());
    _setupScroll(context);
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, wishListState) {
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            return Scaffold(
              backgroundColor: AppColors.appWhite,
              key: productPageScaffold,
              drawerScrimColor: Colors.transparent,
              appBar: buildAppAppBar(
                () {
                  Navigator.pop(context);
                },
                actionBuilder: const CartWishlistBar(),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Select carbon reducing products',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor)),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Stack(
                          children: [
                            ScrollIndicator(
                              filled: true,
                              scrollController: scrollController,
                              //66
                              width: MediaQuery.of(context).size.width - 66.w,
                              height: 8.h,
                              indicatorWidth: 30.w,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: AppColors.lightGrey.withOpacity(.3),
                                  borderRadius: BorderRadius.circular(50.r)),
                              indicatorDecoration: BoxDecoration(
                                  color: AppColors.scrollIndicatorColor,
                                  borderRadius: BorderRadius.circular(50.r)),
                            ),
                            // Text(BlocProvider.of<ProductsBloc>(context).state.products.length.toString())
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
              body: BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const HomeProductsSekeleton();
                  }
                  if (state.hasError && state.products.isEmpty) {
                    print("Error!108");
                    print(state.toString());
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Error in loading products'),
                          CupertinoButton(
                              child: const Text("Retry"),
                              onPressed: () {
                                BlocProvider.of<ProductsBloc>(context)
                                    .add(const ProductsEvent.started());

                                BlocProvider.of<CartBloc>(context)
                                    .add(const CartEvent.cartStarted());

                                BlocProvider.of<WishListBloc>(context)
                                    .add(const WishListEvent.started());
                              })
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: ListView.separated(
                        controller: scrollController,
                        itemCount: state.products.length +
                            (state.isMoreLoading ? 1 : 0),
                        itemBuilder: (BuildContext context, int index) {
                          if (index < state.products.length) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<ProductDetailsBloc>(context)
                                    .add(ProductDetailsEvent.started(
                                        productIds: state.products
                                            .map((e) => e.id)
                                            .toList()));

                                Navigator.pushNamed(
                                  context,
                                  Routes.newProductDetailsScreen,
                                  arguments: {
                                    'products': state.products,
                                    'page': index
                                  },
                                );
                              },
                              child: ProductCard(
                                product: state.products[index],
                              ),
                            );
                          } else {
                            Future.delayed(Duration(milliseconds: 30), () {
                              scrollController.jumpTo(
                                  scrollController.position.maxScrollExtent);
                            });
                            return const CupertinoActivityIndicator();
                          }
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 28.h,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (_) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        backgroundColor: Colors.transparent,
        content: Container(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            color: AppColors.appWhite,
            child: CircleAvatar()),
      );
    },
  );
}
