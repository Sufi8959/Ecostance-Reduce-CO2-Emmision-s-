import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/app_widgets/cart_wishlist_bar.dart';
import 'package:net_carbons/presentation/home-products/screen_home.dart';
import 'package:net_carbons/presentation/home-products/widgets/product_card.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:net_carbons/presentation/search_page/bloc/search_bloc.dart';
import 'package:net_carbons/presentation/single_product_page/bloc/product_details_bloc.dart';

import '../resources/route_manager.dart';

GlobalKey<ScaffoldState> searchPageScaffold = GlobalKey<ScaffoldState>();

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  ScrollController scrollController = ScrollController();

  _setupScroll(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          final bloc = BlocProvider.of<SearchBloc>(
              searchPageScaffold.currentContext ?? context);
          bloc.add(const SearchEvent.loadMore());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setupScroll(context);
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          key: searchPageScaffold,
          appBar: buildAppAppBar(() {
            Navigator.pop(context);
          }, actionBuilder: const CartWishlistBar()),
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.white,
                pinned: true,
                expandedHeight: 172.h,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  centerTitle: true,
                  title: SizedBox(
                    height: 120.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.2),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryActiveColor,
                                    width: 1),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryActiveColor,
                                    width: 1),
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    //strokeAlign: StrokeAlign.outside,
                                    color: AppColors.primaryActiveColor,
                                    width: 1),
                              ),
                              hintText: 'Search here...',
                              alignLabelWithHint: true,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: AppColors.appGreyColor),
                            ),
                            textInputAction: TextInputAction.search,
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(color: AppColors.primaryActiveColor),
                            onChanged: (newValue) {
                              BlocProvider.of<SearchBloc>(context)
                                  .add(Search(keyWord: newValue.trim()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                elevation: 0,
              ),
              state.isLoading
                  ? const SliverToBoxAdapter(
                      child: CupertinoActivityIndicator())
                  : state.products.isNotEmpty
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
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
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w,vertical: 14.h),
                                    child: ProductCard(
                                        product: state.products[index]),
                                  ));
                            },
                            childCount: state.products.length,
                          ),
                        )
                      : const SliverToBoxAdapter(
                          child: Center(child: Text('')),
                        )
            ],
          ),
        );
      },
    );
  }
}
