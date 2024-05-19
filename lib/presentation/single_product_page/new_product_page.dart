import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

ValueNotifier<int> indicatorNotifier = ValueNotifier<int>(0);

GlobalKey<ScaffoldState> productPageScaffoldN = GlobalKey<ScaffoldState>();

// class NewScreenSingleProduct extends StatefulWidget {
//   const NewScreenSingleProduct({
//     super.key,
//   });
//
//   @override
//   State<NewScreenSingleProduct> createState() => _ScreenSingleProductStateNew();
// }
//
// class _ScreenSingleProductStateNew extends State<NewScreenSingleProduct>
//     with SingleTickerProviderStateMixin {
//   late PageController _imageViewageController;
//   late TabController _tabController;
//   late ScrollController _scrollController;
//
//   late ProductModal productModal;
//   int currentImage = 0;
//   bool isInWishList = false;
//   bool firstRun = true;
//   int activeTab = 0;
//   late StreamController<dartz.Either<Failure, ProductModal>> streamController;
//   final repository = getIt<SingleProductRepository>();
//   late AppControllerState appControllerState;
//   late PageController _rootPageController;
//   @override
//   void initState() {
//     appControllerState = BlocProvider.of<AppControllerBloc>(context).state;
//
//     _imageViewageController = PageController();
//     _rootPageController = PageController();
//     _tabController = TabController(length: 4, vsync: this);
//     _tabController.addListener(() {
//       setState(() {
//         activeTab = _tabController.index;
//       });
//     });
//
//     // _scrollController = ScrollController()..addListener(() => setState(() {}));
//     _scrollController = ScrollController();
//
//     streamController = StreamController();
//
//     super.initState();
//   }
//
//   // bool get _isAppBarExpanded {
//   //   return _scrollController.hasClients &&
//   //       _scrollController.offset > (200 - kToolbarHeight);
//   // }
//
//   init() async {
//     final res = await repository.fetchProductData(productModal.id,
//         appControllerState.countryModal?.currencyCode ?? "USD");
//     res.fold((fail) {
//       streamController.add(dartz.Left(fail));
//     }, (success) {
//       streamController.add(dartz.Right(success));
//     });
//   }
//
//   @override
//   void dispose() {
//     _imageViewageController.dispose();
//     _tabController.dispose();
//     _scrollController.dispose();
//     indicatorNotifier.value = 0;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     final args =
//         ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
//     final List<ProductModal> products = args['products'];
//     final page = args['page'];
//     firstRun
//         ? WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//             page != 0
//                 ? _rootPageController.animateToPage(page,
//                     duration: const Duration(microseconds: 1),
//                     curve: Curves.slowMiddle)
//                 : null;
//           })
//         : null;
//     return Scaffold(
//       endDrawerEnableOpenDragGesture: false,
//       key: productPageScaffoldN,
//       endDrawer:
//           Container(color: Colors.white, child: SafeArea(child: CartDrawer())),
//       extendBodyBehindAppBar: true,
//       body: PageView.builder(
//           onPageChanged: (newIndex) {
//             indicatorNotifier.value = 0;
//           },
//           controller: _rootPageController,
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             _scrollController.dispose();
//             productModal = products[index];
//             _imageViewageController.dispose();
//             streamController.close();
//
//             _imageViewageController = PageController();
//             _scrollController = ScrollController();
//             streamController = StreamController();
//
//             firstRun = true;
//             firstRun ? init() : null;
//             firstRun = false;
//             return BlocBuilder<WishListBloc, WishListState>(
//               builder: (context, wishListState) {
//                 isInWishList = wishListState.items
//                     .any((item) => item.id == productModal.id);
//                 return BlocBuilder<CartBloc, CartState>(
//                   builder: (context, cartState) {
//                     bool inCart =
//                         cartState.products.containsKey(productModal.id);
//                     int currentQuantity =
//                         cartState.products.containsKey(productModal.id)
//                             ? cartState.products[productModal.id]!.quantity
//                             : 0;
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child:
//                               StreamBuilder<
//                                       dartz.Either<Failure, ProductModal>>(
//                                   stream: streamController.stream,
//                                   builder: (context, snapshot) {
//                                     if (snapshot.hasData) {
//                                       return snapshot.data!.fold((l) {
//                                         return CustomScrollView(
//                                           slivers: [
//                                             SliverAppBar(
//                                               backgroundColor:
//                                                   Colors.transparent,
//                                               automaticallyImplyLeading: true,
//                                               leading: IconButton(
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                   },
//                                                   icon: const Icon(
//                                                     Icons.arrow_back_ios,
//                                                     color: AppColors
//                                                         .primaryActiveColor,
//                                                   )),
//                                             ),
//                                             SliverToBoxAdapter(
//                                               child: Column(
//                                                 children: [
//                                                   const SizedBox(
//                                                     child:
//                                                         Text("Unable to load"),
//                                                   ),
//                                                   CupertinoButton(
//                                                       child:
//                                                           const Text('Retry'),
//                                                       onPressed: () {
//                                                         init();
//                                                       })
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         );
//                                       }, (ProductModal productData) {
//                                         final sgds = productData.details.sdgs;
//                                         List<SdgElementModal> sdgList =
//                                             productData.details.sdgs;
//                                         List<SdgElementModal> fullFilledList =
//                                             sdgList
//                                                 .where((element) =>
//                                                     element.fulFilled == true)
//                                                 .toList();
//
//                                         return CustomScrollView(
//                                           controller: _scrollController,
//                                           slivers: [
//                                             SliverAppBar(
//                                               automaticallyImplyLeading: false,
//                                               backgroundColor:
//                                                   Colors.transparent,
//                                               expandedHeight: 338.h,
//                                               flexibleSpace: SizedBox(
//                                                 child: Stack(
//                                                   children: [
//                                                     PageView.builder(
//                                                       onPageChanged: (value) {
//                                                         indicatorNotifier
//                                                             .value = value;
//                                                         setState(() {
//                                                           currentImage = value;
//                                                         });
//                                                       },
//                                                       controller:
//                                                           _imageViewageController,
//                                                       itemCount: productData
//                                                           .image.length,
//                                                       itemBuilder:
//                                                           (context, index) {
//                                                         return Container(
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .only(
//                                                               bottomLeft: Radius
//                                                                   .circular(
//                                                                       28.w),
//                                                               bottomRight:
//                                                                   Radius
//                                                                       .circular(
//                                                                           28.w),
//                                                             ),
//                                                             image:
//                                                                 DecorationImage(
//                                                               onError: (exception,
//                                                                       stackTrace) =>
//                                                                   const Center(
//                                                                 child: Icon(Icons
//                                                                     .error_outline_outlined),
//                                                               ),
//                                                               image:
//                                                                   NetworkImage(
//                                                                 productData
//                                                                         .image[
//                                                                     index],
//                                                               ),
//                                                               fit: BoxFit.cover,
//                                                             ),
//                                                           ),
//                                                         );
//                                                       },
//                                                     ),
//                                                     Positioned(
//                                                       left: 0,
//                                                       right: 0,
//                                                       bottom: 17.h,
//                                                       child:
//                                                           StepPageIndicatorScrollable(
//                                                         animationOffset: 20,
//                                                         stepSpacing: 6,
//                                                         height: 4,
//                                                         currentPageNotifier:
//                                                             indicatorNotifier,
//                                                         itemCount: productData
//                                                             .image.length,
//                                                         selectedStep: Container(
//                                                           width: 60.w,
//                                                           height: 4.h,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         3),
//                                                             color: AppColors
//                                                                 .primaryActiveColor,
//                                                           ),
//                                                         ),
//                                                         previousStep: Container(
//                                                           width: 60.w,
//                                                           height: 4.h,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         3),
//                                                             color: AppColors
//                                                                 .primaryInactive,
//                                                           ),
//                                                         ),
//                                                         nextStep: Container(
//                                                           width: 60.w,
//                                                           height: 4.h,
//                                                           decoration:
//                                                               BoxDecoration(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         3),
//                                                             color: AppColors
//                                                                 .primaryInactive,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Positioned(
//                                                       bottom: 42.h,
//                                                       right: 20.w,
//                                                       child: Row(
//                                                         children: !fullFilledList
//                                                                 .length.isFinite
//                                                             ? []
//                                                             : List.generate(
//                                                                 fullFilledList
//                                                                     .length,
//                                                                 (index) =>
//                                                                     Container(
//                                                                       padding: const EdgeInsets
//                                                                               .only(
//                                                                           left:
//                                                                               5),
//                                                                       width:
//                                                                           48.w,
//                                                                       height:
//                                                                           48.w,
//                                                                       child: Image
//                                                                           .network(
//                                                                         fullFilledList[index]
//                                                                             .sdg
//                                                                             .image,
//                                                                         errorBuilder: ((context,
//                                                                                 error,
//                                                                                 stackTrace) =>
//                                                                             Icon(
//                                                                               Icons.error_outline_outlined,
//                                                                               size: 48.w,
//                                                                             )),
//                                                                       ),
//                                                                     )),
//                                                       ),
//                                                     ),
//                                                     Positioned(
//                                                       top: 56.h,
//                                                       left: 0,
//                                                       right: 0,
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           IconButton(
//                                                             onPressed: () {
//                                                               Navigator.pop(
//                                                                   context);
//                                                             },
//                                                             icon: Padding(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       left:
//                                                                           26.w),
//                                                               child: Icon(
//                                                                 Icons
//                                                                     .arrow_back_ios,
//                                                                 color: AppColors
//                                                                     .primaryActiveColor,
//                                                                 size: 28.sp,
//                                                               ),
//                                                             ),
//                                                             padding:
//                                                                 EdgeInsets.zero,
//                                                           ),
//                                                           const LogoBar(),
//                                                           Opacity(
//                                                               opacity: 0,
//                                                               child: IconButton(
//                                                                   onPressed:
//                                                                       () {},
//                                                                   icon: const Icon(
//                                                                       Icons
//                                                                           .menu)))
//                                                         ],
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                               actions: [],
//                                               actionsIconTheme:
//                                                   const IconThemeData(
//                                                       color:
//                                                           Colors.transparent),
//                                             ),
//
//                                             SliverAppBar(
//                                               actions: [SizedBox()],
//                                               automaticallyImplyLeading: false,
//                                               elevation: 10,
//                                               backgroundColor: Colors.white,
//                                               pinned: false,
//                                               flexibleSpace: Padding(
//                                                 padding: EdgeInsets.only(
//                                                     left: 16.w,
//                                                     right: 16.w,
//                                                     bottom: 0),
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       height: 20.h,
//                                                     ),
//                                                     ProductTitle(
//                                                       title: productData
//                                                           .name,
//                                                     ),
//                                                     Row(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .end,
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceBetween,
//                                                       children: [
//                                                         Row(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .start,
//                                                             children: [
//                                                               Text(
//                                                                 (productData
//                                                                         .priceLocal
//                                                                         ?.currency ??
//                                                                     productData
//                                                                         .priceInUsd
//                                                                         .currency),
//                                                                 style: Theme.of(
//                                                                         context)
//                                                                     .textTheme
//                                                                     .headline2
//                                                                     ?.copyWith(
//                                                                         color: AppColors
//                                                                             .primaryActiveColor),
//                                                               ),
//                                                               Text(
//                                                                 " ${productData.priceLocal?.currencySymbol ?? productData.priceInUsd.currencySymbol}${getPriceFormatted(productData.priceLocal?.currency ?? productData.priceInUsd.currency,productData.priceLocal?.oldPrice ?? productData.priceInUsd.oldPrice)}",
//                                                                 style: Theme.of(
//                                                                         context)
//                                                                     .textTheme
//                                                                     .headline2
//                                                                     ?.copyWith(
//                                                                         color: AppColors
//                                                                             .appGreyColor,
//                                                                         decoration:
//                                                                             TextDecoration.lineThrough),
//                                                               ),
//                                                               Text(
//                                                                 " / ${productData.priceLocal?.currencySymbol ?? productData.priceInUsd.currencySymbol}${getPriceFormatted(productData.priceLocal?.currency ?? productData.priceInUsd.currency,productData.priceLocal?.price ?? productData.priceInUsd.price)}",
//                                                                 style: Theme.of(
//                                                                         context)
//                                                                     .textTheme
//                                                                     .headline2
//                                                                     ?.copyWith(
//                                                                         color: AppColors
//                                                                             .primaryActiveColor),
//                                                               ),
//                                                             ]),
//                                                         Ratings(
//                                                           rating: productData
//                                                               .avgRating,
//                                                           ratingCount: 5,
//                                                           size: 24.w,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             SliverToBoxAdapter(
//                                               child: SizedBox(
//                                                 height: height / 1.496,
//                                                 child: Row(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     RotatedBox(
//                                                       quarterTurns: 1,
//                                                       child: TabBar(
//                                                         indicatorWeight: 4,
//                                                         indicatorColor: AppColors
//                                                             .primaryActiveColor,
//                                                         isScrollable: true,
//                                                         padding:
//                                                             EdgeInsets.zero,
//                                                         indicatorSize:
//                                                             TabBarIndicatorSize
//                                                                 .label,
//                                                         controller:
//                                                             _tabController,
//                                                         tabs: [
//                                                           Tab(
//                                                             child: RotatedBox(
//                                                                 quarterTurns: 3,
//                                                                 child:
//                                                                     SvgPicture
//                                                                         .asset(
//                                                                   _tabController
//                                                                               .index ==
//                                                                           0
//                                                                       ? SvgAssets
//                                                                           .homeIconActive
//                                                                       : SvgAssets
//                                                                           .homeIcon,
//                                                                   height: 24.h,
//                                                                 )),
//                                                           ),
//                                                           Tab(
//                                                             child: RotatedBox(
//                                                                 quarterTurns: 3,
//                                                                 child: SvgPicture.asset(
//                                                                     _tabController.index ==
//                                                                             1
//                                                                         ? SvgAssets
//                                                                             .sdgsIconActive
//                                                                         : SvgAssets
//                                                                             .sdgsIcon,
//                                                                     height:
//                                                                         24.h)),
//                                                           ),
//                                                           Tab(
//                                                             child: RotatedBox(
//                                                                 quarterTurns: 3,
//                                                                 child: SvgPicture.asset(
//                                                                     _tabController.index ==
//                                                                             2
//                                                                         ? SvgAssets
//                                                                             .reviewsIconActive
//                                                                         : SvgAssets
//                                                                             .reviewsIcon,
//                                                                     height:
//                                                                         24.h)),
//                                                           ),
//                                                           Tab(
//                                                             child: RotatedBox(
//                                                                 quarterTurns: 3,
//                                                                 child: SvgPicture.asset(
//                                                                     _tabController.index ==
//                                                                             3
//                                                                         ? SvgAssets
//                                                                             .locationIconActive
//                                                                         : SvgAssets
//                                                                             .locationIcon,
//                                                                     height:
//                                                                         24.h)),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(
//                                                       width: 18.w,
//                                                     ),
//                                                     Flexible(
//                                                       child: Padding(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 top: 18.h,
//                                                                 right: 16.w),
//                                                         child: TabBarView(
//                                                           physics:
//                                                               const AlwaysScrollableScrollPhysics(),
//                                                           controller:
//                                                               _tabController,
//                                                           children: [
//                                                             //TODO height and scroll issue
//                                                             SingleChildScrollView(
//                                                               child: Column(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Text(
//                                                                     "Description",
//                                                                     style: Theme.of(
//                                                                             context)
//                                                                         .textTheme
//                                                                         .headline2
//                                                                         ?.copyWith(
//                                                                             color:
//                                                                                 AppColors.primaryActiveColor,
//                                                                             fontSize: 18),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height: 4.h,
//                                                                   ),
//                                                                   ExpandableText(
//                                                                       text: productData
//                                                                           .shortDescription,
//                                                                       textHeight:
//                                                                           400,
//                                                                       textStyle: Theme.of(
//                                                                               context)
//                                                                           .textTheme
//                                                                           .bodyText1!
//                                                                           .copyWith(
//                                                                               color: AppColors.appGreyColor,
//                                                                               height: 1.43)),
//                                                                   SizedBox(
//                                                                     height:
//                                                                         12.h,
//                                                                   ),
//                                                                   ProjectDetailsTable(
//                                                                     productData:
//                                                                         productData,
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height:
//                                                                         27.h,
//                                                                   ),
//                                                                   GridView.builder(
//                                                                       padding: EdgeInsets.zero,
//                                                                       shrinkWrap: true,
//                                                                       itemCount: sdgList.length,
//                                                                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 5.w, crossAxisCount: 4),
//                                                                       itemBuilder: (context, index) {
//                                                                         return Container(
//                                                                           decoration:
//                                                                               BoxDecoration(
//                                                                             image:
//                                                                                 DecorationImage(
//                                                                               fit: BoxFit.cover,
//                                                                               colorFilter: sdgList[index].fulFilled ? null : ColorFilter.mode(AppColors.appGreyColor.withOpacity(0.3), BlendMode.dstATop),
//                                                                               image: NetworkImage(
//                                                                                 sgds[index].sdg.image,
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           height:
//                                                                               57.w,
//                                                                           width:
//                                                                               57.w,
//                                                                         );
//                                                                       }),
//                                                                   SizedBox(
//                                                                     height:
//                                                                         39.h,
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             SingleChildScrollView(
//                                                               child: Column(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Text(
//                                                                     "Sustainable development goals",
//                                                                     style: Theme.of(
//                                                                             context)
//                                                                         .textTheme
//                                                                         .headline2
//                                                                         ?.copyWith(
//                                                                           color:
//                                                                               AppColors.primaryActiveColor,
//                                                                         ),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height: 4.h,
//                                                                   ),
//                                                                   ListView
//                                                                       .separated(
//                                                                     separatorBuilder:
//                                                                         (context,
//                                                                             index) {
//                                                                       return SizedBox(
//                                                                         height:
//                                                                             22.h,
//                                                                       );
//                                                                     },
//                                                                     padding:
//                                                                         EdgeInsets
//                                                                             .zero,
//                                                                     shrinkWrap:
//                                                                         true,
//                                                                     itemBuilder:
//                                                                         (context,
//                                                                             index) {
//                                                                       final SdgElementModal
//                                                                           sdgElement =
//                                                                           fullFilledList[
//                                                                               index];
//                                                                       return Row(
//                                                                           crossAxisAlignment:
//                                                                               CrossAxisAlignment.center,
//                                                                           children: [
//                                                                             SizedBox(
//                                                                               width: 56.w,
//                                                                               height: 56.w,
//                                                                               child: Image.network(
//                                                                                 sdgElement.sdg.image,
//                                                                                 errorBuilder: ((context, error, stackTrace) => Icon(
//                                                                                       Icons.error_outline_outlined,
//                                                                                       size: 50.h,
//                                                                                     )),
//                                                                               ),
//                                                                             ),
//                                                                             SizedBox(
//                                                                               width: 15.w,
//                                                                             ),
//                                                                             Expanded(
//                                                                                 child: Opacity(
//                                                                               opacity: sdgElement.fulFilled ? 1 : .5,
//                                                                               child: ExpandableText(
//                                                                                 text: fullFilledList[index].sdg.description,
//                                                                                 textHeight: 50.h,
//                                                                                 textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColors.primaryActiveColor),
//                                                                               ),
//                                                                             ))
//                                                                             // Expanded(
//                                                                             //   child:
//                                                                             //
//                                                                             //       Text(
//                                                                             //     fullFilledList[index].sdg.description,
//                                                                             //     style: TextStyle(color: sdgElement.fulFilled ? AppColors.appGreyColor : Colors.grey),
//                                                                             //   ),
//                                                                             // )
//                                                                           ]);
//                                                                     },
//                                                                     itemCount:
//                                                                         fullFilledList
//                                                                             .length,
//                                                                   ),
//                                                                   Container(
//                                                                     height:
//                                                                         24.h,
//                                                                   ),
//                                                                   Column(
//                                                                     crossAxisAlignment:
//                                                                         CrossAxisAlignment
//                                                                             .start,
//                                                                     children: List.generate(
//                                                                         productData
//                                                                             .details
//                                                                             .standards
//                                                                             .length,
//                                                                         (index) => Image.network(productData
//                                                                             .details
//                                                                             .standards[0]
//                                                                             .logo))
//                                                                       ..insert(
//                                                                           0,
//                                                                           Text(
//                                                                               'STANDARDS:',
//                                                                               style: Theme.of(context).textTheme.headline2?.copyWith(color: AppColors.primaryActiveColor),
//                                                                             )),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height:
//                                                                         31.h,
//                                                                   ),
//                                                                   // Row(
//                                                                   //   mainAxisAlignment:
//                                                                   //       MainAxisAlignment
//                                                                   //           .end,
//                                                                   //   children: [
//                                                                   //     Transform
//                                                                   //         .scale(
//                                                                   //       origin: Offset(
//                                                                   //           -10.w,
//                                                                   //           0),
//                                                                   //       scale:
//                                                                   //           2.2,
//                                                                   //       child: SvgPicture.asset(
//                                                                   //           SvgAssets.fileDownloadButton),
//                                                                   //     ),
//                                                                   //     Expanded(
//                                                                   //         child:
//                                                                   //             Transform.translate(
//                                                                   //       offset: Offset(
//                                                                   //           30.w,
//                                                                   //           0),
//                                                                   //       child:
//                                                                   //           Column(
//                                                                   //         mainAxisAlignment:
//                                                                   //             MainAxisAlignment.start,
//                                                                   //         crossAxisAlignment:
//                                                                   //             CrossAxisAlignment.start,
//                                                                   //         children: [
//                                                                   //           Text(
//                                                                   //             "Example.pdf",
//                                                                   //             style: Theme.of(context).textTheme.subtitle1?.copyWith(color: AppColors.primaryActiveColor),
//                                                                   //           ),
//                                                                   //           Text("26.64 MB",
//                                                                   //               style: Theme.of(context).textTheme.bodyText2?.copyWith(color: AppColors.appGreyColor))
//                                                                   //         ],
//                                                                   //       ),
//                                                                   //     )),
//                                                                   //     AppOutlinedButton(
//                                                                   //         height:
//                                                                   //             47,
//                                                                   //         filled:
//                                                                   //             true,
//                                                                   //         onTap:
//                                                                   //             () {},
//                                                                   //         text:
//                                                                   //             Padding(
//                                                                   //           padding:
//                                                                   //               EdgeInsets.symmetric(horizontal: 8.w),
//                                                                   //           child:
//                                                                   //               Text("Download", style: Theme.of(context).textTheme.headline2),
//                                                                   //         ))
//                                                                   //   ],
//                                                                   // )
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                             ReviewBuilder(
//                                                               productId:
//                                                                   productData
//                                                                       .id, state: null,
//                                                             ),
//                                                             Column(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .start,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text(
//                                                                     "Locations",
//                                                                     style: Theme.of(
//                                                                             context)
//                                                                         .textTheme
//                                                                         .headline2
//                                                                         ?.copyWith(
//                                                                             fontSize:
//                                                                                 18)),
//                                                                 SizedBox(
//                                                                   height: 4.h,
//                                                                 ),
//                                                                 Expanded(
//                                                                   child:
//                                                                       Container(
//                                                                     margin: EdgeInsets.only(
//                                                                         bottom:
//                                                                             40.h),
//                                                                     child:
//                                                                         MapView(
//                                                                       title: productData
//                                                                           .name,
//                                                                       latLngList: productData
//                                                                           .details
//                                                                           .location
//                                                                           .map(
//                                                                               (e) {
//                                                                         if (e
//                                                                             .degreeDecimal
//                                                                             .coordinates
//                                                                             .isNotEmpty) {
//                                                                           return LatLng(
//                                                                               e.degreeDecimal.coordinates[0],
//                                                                               e.degreeDecimal.coordinates[1]);
//                                                                         } else {
//                                                                           return null;
//                                                                         }
//                                                                       }).toList(),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                             // SliverToBoxAdapter(
//                                             //   child: Container(
//                                             //     color: Colors.amber,
//                                             //     height: Sv.height / 5.6,
//                                             //   ),
//                                             // ),
//                                           ],
//                                         );
//                                       });
//                                     }
//                                     return const Center(
//                                         child: CupertinoActivityIndicator());
//                                   }),
//                         ),
//                         _buildBottomSheet(
//                             cartState, inCart, currentQuantity, context)
//                       ],
//                     );
//                   },
//                 );
//               },
//             );
//           }),
//     );
//   }
//
//   Container _buildBottomSheet(CartState cartState, bool inCart,
//       int currentQuantity, BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, -8),
//           ),
//         ],
//       ),
//       height: 179.h,
//       padding: EdgeInsets.only(top: 9.h, left: 10.w, right: 10.w, bottom: 42.h),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 60.h,
//                 width: 117.w,
//                 child: cartState.isLoading
//                     ? const Center(child: CupertinoActivityIndicator())
//                     : inCart
//                         ? CartItemCountTool(
//                             iconSize: 24.sp,
//                             height: 60.h,
//                             currentQuanity: currentQuantity,
//                             onDecrement: () {
//                               BlocProvider.of<CartBloc>(context).add(
//                                   CartEvent.alterItem(
//                                       product: productModal
//                                           .toProductCartModalWithQuantity(1),
//                                       action: AlterItemAction.decrement));
//                             },
//                             onIncrement: () {
//                               BlocProvider.of<CartBloc>(context).add(
//                                   CartEvent.alterItem(
//                                       product: productModal
//                                           .toProductCartModalWithQuantity(1),
//                                       action: AlterItemAction.increment));
//                             },
//                             width: 117.w,
//                           )
//                         : AppOutlinedButton(
//                             filled: true,
//                             height: height / 16.88,
//                             onTap: () {
//                               BlocProvider.of<CartBloc>(context).add(
//                                 CartEvent.addItem(
//                                   product: productModal
//                                       .toProductCartModalWithQuantity(1),
//                                 ),
//                               );
//                             },
//                             text: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 8.w),
//                               child: Text(ButtonStrings.addToCart,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline2
//                                       ?.copyWith(fontSize: 14.sp)),
//                             )),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   width: 10.w,
//                 ),
//               ),
//               Container(
//                 height: 60.h,
//                 width: 60.h,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: AppColors.squireBox,
//                     width: 1,
//                   ),
//                 ),
//                 child: IconButton(
//                     onPressed: !isInWishList
//                         ? () {
//                             BlocProvider.of<WishListBloc>(context).add(
//                               WishListEvent.addItem(
//                                 product: productModal,
//                               ),
//                             );
//                           }
//                         : () {
//                             BlocProvider.of<WishListBloc>(context).add(
//                               WishListEvent.removeItem(
//                                 product: productModal,
//                               ),
//                             );
//                           },
//                     icon: Icon(
//                       isInWishList ? Icons.favorite : Icons.favorite_outline,
//                       size: 28.w,
//                     )),
//               ),
//               SizedBox(
//                 width: 10.w,
//               ),
//               Container(
//                 height: 60.h,
//                 width: 60.h,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: AppColors.squireBox,
//                     width: 1,
//                   ),
//                 ),
//                 child: IconButton(
//                     onPressed: () {
//                       productPageScaffoldN.currentState?.openEndDrawer();
//                     },
//                     icon: Icon(
//                       Icons.shopping_cart_outlined,
//                       size: 28.w,
//                     )),
//               ),
//             ],
//           ),
//           Flexible(
//             child: SizedBox(
//               height: 16.h,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: AppOutlinedButton(
//                   height: 60.h,
//                   filled: true,
//                   onTap: () {
//                     final authState = BlocProvider.of<AuthBloc>(context).state;
//
//                     if (authState is Authenticated) {
//                       BlocProvider.of<CheckoutBloc>(context).add(
//                           CheckoutEvent.started(
//                               productCartModal: productModal
//                                   .toProductCartModalWithQuantity(1),
//                               checkoutType: CheckoutType.express));
//                       Navigator.pushNamed(
//                         context,
//                         Routes.checkoutScreen,
//                       );
//                     } else {
//                       Navigator.pushNamed(
//                         context,
//                         Routes.screenYouAreNotSignedIn,
//                       );
//                     }
//                   },
//                   text: Text(
//                     ButtonStrings.buyNow,
//                     style: Theme.of(context).textTheme.headline2,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final double titleWidth = MediaQuery.of(context).size.width * 0.70;
    final double titleHeight = MediaQuery.of(context).size.height * 0.06;
    return Container(
      height: titleHeight,
      width: titleWidth,
      child: TextScroll(
        "$title.",
        style: Theme.of(context).textTheme.displayLarge?.copyWith(height: 1.2),
        textDirection: TextDirection.ltr,
        mode: TextScrollMode.endless,
        velocity: const Velocity(pixelsPerSecond: Offset(45, 0)),
        fadedBorder: true,
        fadedBorderWidth: 0.1,
        fadeBorderVisibility: FadeBorderVisibility.always,
      ),
    );
    // Text(
    //   title.length < 15 ? title : "${title.substring(0, 14)}...",
    //   style: Theme.of(context).textTheme.displayLarge?.copyWith(height: 1.2),
    //   maxLines: 1,
    // );
  }
}
