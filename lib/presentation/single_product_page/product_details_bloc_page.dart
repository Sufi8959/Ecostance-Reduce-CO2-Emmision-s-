import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/auth/auth_bloc.dart';
import 'package:net_carbons/app/constants/string_constants.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/domain/cart/models/cart_modal.dart';
import 'package:net_carbons/domain/home_products/modal/models.dart';
import 'package:net_carbons/presentation/app_widgets/cart_wishlist_bar.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/cart/bloc/cart_bloc.dart';
import 'package:net_carbons/presentation/cart/cart_drawer.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';
import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';
import 'package:net_carbons/presentation/layout_screen/main_screen.dart';
import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
import 'package:net_carbons/presentation/register/registration_otp_verification.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/route_manager.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/cart_item_count_controller.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/expandable_text.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/shimmer_container.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';
import 'package:net_carbons/presentation/single_product_page/bloc/product_details_bloc.dart';
import 'package:net_carbons/presentation/single_product_page/new_product_page.dart';
import 'package:net_carbons/presentation/single_product_page/widgets/map_view.dart';
import 'package:net_carbons/presentation/single_product_page/widgets/project_details_table.dart';
import 'package:net_carbons/presentation/single_product_page/widgets/ratings.dart';
import 'package:net_carbons/presentation/single_product_page/widgets/review.dart';
import 'package:net_carbons/presentation/single_product_page/widgets/shimmer.dart';
import 'package:net_carbons/presentation/wish_list/bloc/wish_list_bloc.dart';
import 'package:net_carbons/presentation/wish_list/wish_list_drawer.dart';
import 'package:page_view_indicators/scrollable_step_page_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../checkout/screen_you_are_not_signedin.dart';

class SingleProductBlocView extends StatefulWidget {
  const SingleProductBlocView({Key? key}) : super(key: key);

  @override
  State<SingleProductBlocView> createState() => _SingleProductBlocViewState();
}

class _SingleProductBlocViewState extends State<SingleProductBlocView> {
  late PageController _rootPageController;
  @override
  void initState() {
    _rootPageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _rootPageController.dispose();
    if (mounted) {
      BlocProvider.of<ProductDetailsBloc>(context)
          .add(ProductDetailsEvent.viewComplete());
    }

    super.dispose();
  }

  bool firstRun = true;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final page = args['page'];
    firstRun
        ? WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            BlocProvider.of<ProductDetailsBloc>(context)
                .add(ProductDetailsEvent.loadProductWithIndex(index: page));
            page != 0
                ? _rootPageController.animateToPage(page,
                    duration: const Duration(microseconds: 1),
                    curve: Curves.slowMiddle)
                : null;
          })
        : null;
    return Scaffold(
      //  appBar:  buildAppAppBar((){Navigator.pop(context);}),
      drawer: const WishListDrawer(),
      endDrawer: CartDrawer(),
      body: PageView.builder(
        controller: _rootPageController,
        onPageChanged: (index) {
          BlocProvider.of<ProductDetailsBloc>(context)
              .add(ProductDetailsEvent.loadProductWithIndex(index: index));
        },
        itemBuilder: (context, index) {
          indicatorNotifier.value = 0;
          firstRun = false;
          return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              // if (state.hasError && state.productIds.isNotEmpty) {
              //   BlocProvider.of<ProductDetailsBloc>(context).add(
              //       ProductDetailsEvent.loadProductWithIndex(
              //           index: state.productIds.indexOf(state.currentId)));
              // }
              if (state.productIds.isEmpty) {
                return const Center(child: Text("No data"));
              }

              if (state.productIds[index] == state.productModal.id) {
                return ProductPageView(
                  state: state,
                  productModal: state.productModal,
                );
              } else {
                return const ShimmerProductDetails();
              }
            },
          );
        },
        itemCount: BlocProvider.of<ProductDetailsBloc>(context)
            .state
            .productIds
            .length,
      ),
    );
  }
}

class ProductPageView extends StatefulWidget {
  ProductPageView({Key? key, required this.productModal, required this.state})
      : super(key: key);
  final ProductModal productModal;
  final ProductDetailsState state;
  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView>
    with SingleTickerProviderStateMixin {
  bool isInWishList = false;

  late PageController _imageViewageController;
  late TabController _tabController;
  late ScrollController _scrollController;

  int activeTab = 0;
  int currentImage = 0;
  @override
  void initState() {
    BlocProvider.of<ProductDetailsBloc>(context)
        .add(ProductDetailsEvent.getReviews(widget.productModal.id));
    _imageViewageController = PageController();
    _scrollController = ScrollController();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        activeTab = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _imageViewageController.dispose();
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final sgds = widget.productModal.details.sdgs;
    List<SdgElementModal> sdgList = widget.productModal.details.sdgs;
    List<SdgElementModal> fullFilledList =
        sdgList.where((element) => element.fulFilled == true).toList();
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, wishListState) {
        isInWishList = wishListState.items
            .any((item) => item.id == widget.productModal.id);
        return BlocBuilder<CartBloc, CartState>(
          builder: (context, cartState) {
            bool inCart =
                cartState.products.containsKey(widget.productModal.id);
            int currentQuantity =
                cartState.products.containsKey(widget.productModal.id)
                    ? cartState.products[widget.productModal.id]!.quantity
                    : 0;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.transparent,
                      expandedHeight: 338.h,
                      flexibleSpace: SizedBox(
                        child: Stack(
                          children: [
                            PageView.builder(
                              onPageChanged: (value) {
                                indicatorNotifier.value = value;
                                setState(() {
                                  currentImage = value;
                                });
                              },
                              controller: _imageViewageController,
                              itemCount: widget.productModal.image.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(28.w),
                                      bottomRight: Radius.circular(28.w),
                                    ),
                                    image: DecorationImage(
                                      onError: (exception, stackTrace) =>
                                          const Center(
                                        child:
                                            Icon(Icons.error_outline_outlined),
                                      ),
                                      image: NetworkImage(
                                        widget.productModal.image[index],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 17.h,
                              child: StepPageIndicatorScrollable(
                                animationOffset: 20,
                                stepSpacing: 6,
                                height: 4,
                                currentPageNotifier: indicatorNotifier,
                                itemCount: widget.productModal.image.length,
                                selectedStep: Container(
                                  width: 60.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryActiveColor,
                                  ),
                                ),
                                previousStep: Container(
                                  width: 60.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryInactive,
                                  ),
                                ),
                                nextStep: Container(
                                  width: 60.w,
                                  height: 4.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: AppColors.primaryInactive,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 42.h,
                              right: 20.w,
                              child: Row(
                                children: !fullFilledList.length.isFinite
                                    ? []
                                    : List.generate(
                                        fullFilledList.length,
                                        (index) => Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              width: 48.w,
                                              height: 48.w,
                                              child: Image.network(
                                                fullFilledList[index].sdg.image,
                                                errorBuilder: ((context, error,
                                                        stackTrace) =>
                                                    Icon(
                                                      Icons
                                                          .error_outline_outlined,
                                                      size: 48.w,
                                                    )),
                                              ),
                                            )),
                              ),
                            ),
                            // Positioned(
                            //     top: -5,
                            //     left: 0,
                            //     right: 0,
                            //     child: Image.asset(ImageAssets.topWave)),

                            Positioned(
                              bottom: 42.h,
                              left: 20.w,
                              child: GestureDetector(
                                onTap: () {
                                  isInWishList
                                      ? BlocProvider.of<WishListBloc>(context)
                                          .add(WishListEvent.removeItem(
                                              product: widget.productModal))
                                      : BlocProvider.of<WishListBloc>(context)
                                          .add(WishListEvent.addItem(
                                              product: widget.productModal));
                                },
                                child: Container(
                                  color: AppColors.appWhite.withOpacity(.82),
                                  padding: EdgeInsets.all(16.w),
                                  width: 48.w,
                                  height: 48.w,
                                  child: Center(
                                    child: isInWishList
                                        ? SvgPicture.asset(
                                            SvgAssets.favIconFilled)
                                        : SvgPicture.asset(SvgAssets.favIcon),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0.h,
                              left: 14.w,
                              right: 14.w,
                              child: SafeArea(
                                bottom: false,
                                left: false,
                                right: false,
                                child: buildProductDetailPageAppBar(
                                  context,
                                  SizedBox(
                                    width: 100.w,
                                    child: const CartWishlistBar(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: const [
                        //   Row(
                        //   mainAxisAlignment:
                        //   MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(left: 14.w),
                        //       width: 100.w,
                        //       child: Row(
                        //         mainAxisAlignment:
                        //         MainAxisAlignment.start,
                        //         children: [
                        //           GestureDetector(
                        //             onTap: () {
                        //               Navigator.pop(context);
                        //             },
                        //             child: SizedBox(
                        //               width: 40.h,
                        //               height: 40.h,
                        //               child: Stack(
                        //                 children: [
                        //                   Positioned(
                        //                       left: 0,
                        //                       right: 0,
                        //                       top: 0,
                        //                       bottom: 0,
                        //                       child: Container(
                        //                         padding: EdgeInsets.only(left: 4.w),
                        //                         width: 40.h,
                        //                         height: 40.h,
                        //                         decoration: BoxDecoration(
                        //                           shape: BoxShape.circle,
                        //                           color: AppColors.lightGrey.withOpacity(.3),
                        //                         ),
                        //                       )),
                        //                   Positioned(
                        //                     left: 5.w,
                        //                     right: 0,
                        //                     top: 0,
                        //                     bottom: 0,
                        //                     child: Center(
                        //                       child: Icon(
                        //                         Icons.arrow_back_ios,
                        //                         size: 20.h,
                        //                         textDirection: TextDirection.ltr,
                        //                         color: AppColors.primaryActiveColor,
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     const Center(child: LogoBar()),
                        //     SizedBox(
                        //       width: 100.w,
                        //       child: Builder(
                        //         builder: (context) => Row(
                        //           mainAxisAlignment:
                        //           MainAxisAlignment.end,
                        //           crossAxisAlignment:
                        //           CrossAxisAlignment.center,
                        //           children: [
                        //             Stack(
                        //               children: [
                        //                 IconButton(
                        //                   icon: Transform.scale(
                        //                       scale: 1.1,
                        //                       child: SvgPicture.asset(
                        //                           SvgAssets.favIcon)),
                        //                   onPressed: () =>
                        //                       Scaffold.of(context)
                        //                           .openDrawer(),
                        //                   tooltip:
                        //                   MaterialLocalizations.of(
                        //                       context)
                        //                       .openAppDrawerTooltip,
                        //                 ),
                        //                 wishListState.items.isNotEmpty
                        //                     ? Positioned(
                        //                   right: 8.w,
                        //                   top: 0,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                     AppColors.cherryRed,
                        //                     radius: 10,
                        //                     child: Center(
                        //                       child: FittedBox(
                        //                         fit: BoxFit
                        //                             .scaleDown,
                        //                         child: Text(
                        //                             wishListState
                        //                                 .items
                        //                                 .length
                        //                                 .toString(),
                        //                             style: Theme.of(
                        //                                 context)
                        //                                 .textTheme
                        //                                 .subtitle2
                        //                                 ?.copyWith(
                        //                                 color: Colors
                        //                                     .white,
                        //                                 fontWeight:
                        //                                 FontWeight.w800)),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 )
                        //                     : SizedBox()
                        //               ],
                        //             ),
                        //             Stack(
                        //               children: [
                        //                 IconButton(
                        //                   icon: Transform.scale(
                        //                       scale: 1.1,
                        //                       child: SvgPicture.asset(
                        //                           SvgAssets.cartIcon)),
                        //                   onPressed: () =>
                        //                       Scaffold.of(context)
                        //                           .openEndDrawer(),
                        //                   tooltip:
                        //                   MaterialLocalizations.of(
                        //                       context)
                        //                       .openAppDrawerTooltip,
                        //                 ),
                        //                 cartState.products.isNotEmpty
                        //                     ? Positioned(
                        //                   right: 8.w,
                        //                   top: 0,
                        //                   child: CircleAvatar(
                        //                     backgroundColor:
                        //                     AppColors.cherryRed,
                        //                     radius: 10.r,
                        //                     child: Center(
                        //                       child: FittedBox(
                        //                         fit: BoxFit
                        //                             .scaleDown,
                        //                         child: Text(
                        //                             cartState
                        //                                 .products
                        //                                 .length
                        //                                 .toString(),
                        //                             overflow:
                        //                             TextOverflow
                        //                                 .visible,
                        //                             style: Theme.of(
                        //                                 context)
                        //                                 .textTheme
                        //                                 .subtitle2
                        //                                 ?.copyWith(
                        //                                 color: Colors
                        //                                     .white,
                        //                                 fontWeight:
                        //                                 FontWeight.w800)),
                        //                       ),
                        //                     ),
                        //                   ),
                        //                 )
                        //                     : SizedBox()
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                      actionsIconTheme:
                          const IconThemeData(color: Colors.transparent),
                    ),

                    SliverAppBar(
                      actions: [SizedBox()],
                      automaticallyImplyLeading: false,
                      elevation: 10,
                      backgroundColor: Colors.white,
                      pinned: false,
                      flexibleSpace: Padding(
                        padding:
                            EdgeInsets.only(left: 16.w, right: 16.w, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 10.h,
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/left_arrow3.jpg'),
                                    height: 30,
                                    width: 20,
                                    // opacity: 0.5,
                                    // padding top
                                  ),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ProductTitle(
                                        title: widget.productModal.name,
                                      ),
                                    ],
                                  ),
                                  // Add image here
                                  // child: Opacity(opacity: opacity)
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/right_arrow3.jpg'),
                                    height: 30,
                                    width: 22,
                                    // opacity: 0.5,
                                    // padding top
                                  ),

                                  // Ratings(
                                  //   rating: widget.productModal.avgRating,
                                  //   ratingCount: 5,
                                  //   size: 24.w,
                                  // ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          (widget.productModal.priceLocal
                                                  ?.currency ??
                                              widget.productModal.priceInUsd
                                                  .currency),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: AppColors
                                                      .primaryActiveColor),
                                        ),
                                        Text(
                                          " ${getPriceFormattedWithoutcode(widget.productModal.priceLocal?.currency ?? widget.productModal.priceInUsd.currency, widget.productModal.priceLocal?.oldPrice ?? widget.productModal.priceInUsd.oldPrice)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: AppColors.appGreyColor,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                        ),
                                        Text(
                                          " / ${getPriceFormattedWithoutcode(widget.productModal.priceLocal?.currency ?? widget.productModal.priceInUsd.currency, widget.productModal.priceLocal?.price ?? widget.productModal.priceInUsd.price)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                  color: AppColors
                                                      .primaryActiveColor),
                                        ),
                                      ]),
                                  Ratings(
                                    rating: widget.productModal.avgRating,
                                    ratingCount: 5,
                                    size: 24.w,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: height / 1.496,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RotatedBox(
                              quarterTurns: 1,
                              child: TabBar(
                                indicatorWeight: 4,
                                indicatorColor: AppColors.primaryActiveColor,
                                isScrollable: true,
                                padding: EdgeInsets.zero,
                                indicatorSize: TabBarIndicatorSize.label,
                                controller: _tabController,
                                tabs: [
                                  Tab(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: SvgPicture.asset(
                                          _tabController.index == 0
                                              ? SvgAssets.homeIconActive
                                              : SvgAssets.homeIcon,
                                          height: 24.h,
                                        )),
                                  ),
                                  Tab(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: SvgPicture.asset(
                                            _tabController.index == 1
                                                ? SvgAssets.sdgsIconActive
                                                : SvgAssets.sdgsIcon,
                                            height: 24.h)),
                                  ),
                                  Tab(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: SvgPicture.asset(
                                            _tabController.index == 2
                                                ? SvgAssets.reviewsIconActive
                                                : SvgAssets.reviewsIcon,
                                            height: 24.h)),
                                  ),
                                  Tab(
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: SvgPicture.asset(
                                            _tabController.index == 3
                                                ? SvgAssets.locationIconActive
                                                : SvgAssets.locationIcon,
                                            height: 24.h)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 18.w,
                            ),
                            Flexible(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: 12.h, right: 16.w),
                                child: TabBarView(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  controller: _tabController,
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Description",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                ?.copyWith(
                                                    color: AppColors
                                                        .primaryActiveColor,
                                                    fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          ExpandableText(
                                              text: widget.productModal
                                                  .shortDescription,
                                              textHeight: 400,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      color: AppColors
                                                          .appGreyColor,
                                                      height: 1.43)),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          ProjectDetailsTable(
                                            productData: widget.productModal,
                                          ),
                                          GridView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(), // Disable scrolling within the GridView
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              itemCount: sdgList.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisSpacing: 5.w,
                                                      crossAxisCount: 4),
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      colorFilter: sdgList[
                                                                  index]
                                                              .fulFilled
                                                          ? null
                                                          : ColorFilter.mode(
                                                              AppColors
                                                                  .appGreyColor
                                                                  .withOpacity(
                                                                      0.3),
                                                              BlendMode
                                                                  .dstATop),
                                                      image: NetworkImage(
                                                        sgds[index].sdg.image,
                                                      ),
                                                    ),
                                                  ),
                                                  height: 57.w,
                                                  width: 57.w,
                                                );
                                              }),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sustainable development goals",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline2
                                              ?.copyWith(
                                                color: AppColors
                                                    .primaryActiveColor,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Flexible(
                                          child: ListView.separated(
                                            controller: _scrollController,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                height: 22.h,
                                              );
                                            },
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              final SdgElementModal sdgElement =
                                                  fullFilledList[index];
                                              return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 56.w,
                                                      height: 56.w,
                                                      child: Image.network(
                                                        sdgElement.sdg.image,
                                                        errorBuilder: ((context,
                                                                error,
                                                                stackTrace) =>
                                                            Icon(
                                                              Icons
                                                                  .error_outline_outlined,
                                                              size: 50.h,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15.w,
                                                    ),
                                                    Expanded(
                                                        child: Opacity(
                                                      opacity:
                                                          sdgElement.fulFilled
                                                              ? 1
                                                              : .5,
                                                      child: ExpandableText(
                                                        text: fullFilledList[
                                                                index]
                                                            .sdg
                                                            .description,
                                                        textHeight: 50.h,
                                                        textStyle: Theme.of(
                                                                context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .primaryActiveColor),
                                                      ),
                                                    ))
                                                    // Expanded(
                                                    //   child:
                                                    //
                                                    //       Text(
                                                    //     fullFilledList[index].sdg.description,
                                                    //     style: TextStyle(color: sdgElement.fulFilled ? AppColors.appGreyColor : Colors.grey),
                                                    //   ),
                                                    // )
                                                  ]);
                                            },
                                            itemCount: fullFilledList.length,
                                          ),
                                        ),
                                        Container(
                                          height: 24.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'STANDARDS:',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  ?.copyWith(
                                                      color: AppColors
                                                          .primaryActiveColor),
                                            ),
                                            SizedBox(
                                                height:
                                                    8.0), // Add some spacing between the text and images
                                            Row(
                                              children: List.generate(
                                                widget.productModal.details
                                                    .standards.length,
                                                (index) => Container(
                                                  width:
                                                      100, // Set the desired width
                                                  height:
                                                      100, // Set the desired height
                                                  child: Image.network(
                                                    widget.productModal.details
                                                        .standards[0].logo,
                                                    fit: BoxFit
                                                        .contain, // You can adjust the fit property if needed
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: 31.h,
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment
                                        //           .end,
                                        //   children: [
                                        //     Transform
                                        //         .scale(
                                        //       origin: Offset(
                                        //           -10.w,
                                        //           0),
                                        //       scale:
                                        //           2.2,
                                        //       child: SvgPicture.asset(
                                        //           SvgAssets.fileDownloadButton),
                                        //     ),
                                        //     Expanded(
                                        //         child:
                                        //             Transform.translate(
                                        //       offset: Offset(
                                        //           30.w,
                                        //           0),
                                        //       child:
                                        //           Column(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment.start,
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.start,
                                        //         children: [
                                        //           Text(
                                        //             "Example.pdf",
                                        //             style: Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColors.primaryActiveColor),
                                        //           ),
                                        //           Text("26.64 MB",
                                        //               style: Theme.of(context).textTheme.bodyText2?.copyWith(color: AppColors.appGreyColor))
                                        //         ],
                                        //       ),
                                        //     )),
                                        //     AppOutlinedButton(
                                        //         height:
                                        //             47,
                                        //         filled:
                                        //             true,
                                        //         onTap:
                                        //             () {},
                                        //         text:
                                        //             Padding(
                                        //           padding:
                                        //               EdgeInsets.symmetric(horizontal: 8.w),
                                        //           child:
                                        //               Text("Download", style: Theme.of(context).textTheme.headline2),
                                        //         ))
                                        //   ],
                                        // )
                                      ],
                                    ),
                                    ReviewBuilder(
                                        productId: widget.productModal.id,
                                        state: widget.state,
                                        controller: _scrollController),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Locations",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                ?.copyWith(fontSize: 18)),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(bottom: 40.h),
                                            child: MapView(
                                              title: widget.productModal.name,
                                              latLngList: widget
                                                  .productModal.details.location
                                                  .map((e) {
                                                if (e.degreeDecimal.coordinates
                                                    .isNotEmpty) {
                                                  return LatLng(
                                                      e.degreeDecimal
                                                          .coordinates[0],
                                                      e.degreeDecimal
                                                          .coordinates[1]);
                                                } else {
                                                  return null;
                                                }
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // SliverToBoxAdapter(
                    //   child: Container(
                    //     color: Colors.amber,
                    //     height: Sv.height / 5.6,
                    //   ),
                    // ),
                  ],
                )),
                _buildBottomSheet(cartState, inCart, currentQuantity, context)
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildBottomSheet(CartState cartState, bool inCart,
      int currentQuantity, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      height: 100.h,
      padding: EdgeInsets.only(top: 9.h, left: 14.w, right: 14.w, bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: cartState.isLoading
                ? const Center(child: CupertinoActivityIndicator())
                : inCart
                    ? Container(
                        width: 170.w,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.appGreyColor.withOpacity(1),
                                width: 1)),
                        height: 60.h,
                        child: CartItemCountTool(
                          bottomBorder: false,
                          iconSize: 24.sp,
                          height: 60.h,
                          currentQuanity: currentQuantity,
                          onDecrement: () {
                            BlocProvider.of<CartBloc>(context).add(
                                CartEvent.alterItem(
                                    product: widget.productModal
                                        .toProductCartModalWithQuantity(1),
                                    action: AlterItemAction.decrement));
                          },
                          onIncrement: () {
                            if (widget.productModal.stock > 0) {
                              BlocProvider.of<CartBloc>(context).add(
                                  CartEvent.alterItem(
                                      product: widget.productModal
                                          .toProductCartModalWithQuantity(1),
                                      action: AlterItemAction.increment));
                            }
                          },
                        ),
                      )
                    : AppButton(
                        disabled: widget.productModal.stock <= 0,
                        height: 60.h,
                        filled: false,
                        onTap: () {
                          if (widget.productModal.stock > 0) {
                            BlocProvider.of<CartBloc>(context).add(
                              CartEvent.addItem(
                                product: widget.productModal
                                    .toProductCartModalWithQuantity(1),
                              ),
                            );
                          }
                        },
                        text: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(ButtonStrings.addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor)),
                        ),
                        feedbackTimeText: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text(ButtonStrings.addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(color: AppColors.appWhite)),
                        ),
                      ),
          ),
          SizedBox(
            width: 18.w,
          ),
          Expanded(
            flex: 1,
            child: BlocProvider.of<AuthBloc>(context).state is Authenticated
                ? AppButton(
                    disabled: widget.productModal.stock <= 0,
                    filled: true,
                    height: 60.h,
                    onTap: () {
                      if (widget.productModal.stock > 0) {
                        final authState =
                            BlocProvider.of<AuthBloc>(context).state;

                        _initiateCheckOut(context, authState);
                      }
                    },
                    text: Text(
                      ButtonStrings.buyNow,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: AppColors.appWhite),
                    ),
                    feedbackTimeText: Text(
                      ButtonStrings.buyNow,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: AppColors.primaryActiveColor),
                    ),
                  )
                : OpenContainer(
                    transitionType: ContainerTransitionType.fadeThrough,
                    transitionDuration: const Duration(milliseconds: 300),
                    closedBuilder: (BuildContext ctx, openContainer) =>
                        AppButton(
                      onTap: () async {
                        BlocProvider.of<CheckoutBloc>(context).add(
                            CheckoutEvent.started(
                                productCartModal: widget.productModal
                                    .toProductCartModalWithQuantity(1),
                                checkoutType: CheckoutType.express));
                        openContainer();
                      },
                      text: Text(
                        "LOGIN TO BUY",
                        style: GoogleFonts.workSans(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      filled: true,
                      feedbackTimeText: Text(ButtonStrings.checkout,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor)),
                    ),
                    openBuilder: (BuildContext ctx,
                        void Function({Object? returnValue}) action) {
                      return ScreenYouAreNotSignedIn(
                        ctx: ctx,
                      );
                    },
                    onClosed: (value) {
                      if (value == VerifyStatusEum.VERIFIED) {
                        Navigator.pushNamed(
                                mainScaffold.currentContext ?? context,
                                Routes.checkoutScreen)
                            .then((value) {
                          ///TODO: if error occures make to scaffold key
                          // BlocProvider.of<CartBloc>(mainScaffold.currentContext ?? context)
                          //     .add(const CartEvent.cartStarted());
                        });
                      } else {
                        //Navigator.pop(context);
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _initiateCheckOut(BuildContext context, AuthState authState) {
    BlocProvider.of<CheckoutBloc>(context).add(CheckoutEvent.started(
        productCartModal: widget.productModal.toProductCartModalWithQuantity(1),
        checkoutType: CheckoutType.express));

    if (authState is Authenticated) {
      if (authState.authDataModal.user.emailVerificationStatus !=
          VerifyStatusEum.VERIFIED.name) {
        Navigator.pushNamed(context, Routes.screenRegistrationEnterOtp,
                arguments: OtpVerificationArguments(
                    authState.authDataModal.user.email, Routes.checkoutScreen))
            .then((value) {
          if (value == VerifyStatusEum.VERIFIED) {
            Navigator.pushNamed(mainScaffold.currentContext ?? context,
                    Routes.checkoutScreen)
                .then((value) {
              BlocProvider.of<CartBloc>(mainScaffold.currentContext ?? context)
                  .add(const CartEvent.cartStarted());
            });
          } else {
            Navigator.pop(context);
          }
        });
      } else if (authState.authDataModal.user.emailVerificationStatus ==
          VerifyStatusEum.VERIFIED.name) {
        Navigator.pushNamed(
                mainScaffold.currentContext ?? context, Routes.checkoutScreen)
            .then((value) {
          BlocProvider.of<CartBloc>(mainScaffold.currentContext ?? context)
              .add(const CartEvent.cartStarted());
        });
      }
    } else {
      Navigator.pushNamed(
        context,
        Routes.screenYouAreNotSignedIn,
      ).then((value) {
        if (value == VerifyStatusEum.VERIFIED) {
          Navigator.pushNamed(
                  mainScaffold.currentContext ?? context, Routes.checkoutScreen)
              .then((value) {
            BlocProvider.of<CartBloc>(mainScaffold.currentContext ?? context)
                .add(const CartEvent.cartStarted());
          });
        } else {
          Navigator.pop(context);
        }
      });
    }
  }
}
