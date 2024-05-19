// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:net_carbons/presentation/home-products/bloc/products_bloc.dart';
// import 'package:net_carbons/presentation/layout_screen/widgets/bottom_bar.dart';
// import 'package:net_carbons/presentation/onBoarding/screen_quote.dart';
// import 'package:net_carbons/presentation/onBoarding/screen_video.dart';
// import 'package:net_carbons/presentation/resources/assets.dart';
// import 'package:net_carbons/presentation/resources/route_manager.dart';
//
// import '../resources/color.dart';
//
// class ScreenRegistrationThanks extends StatelessWidget {
//   const ScreenRegistrationThanks({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 11.w),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                     width: 368.w,
//                     height: 292.h,
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(ImageAssets.bear))),
//                   ),
//                   Positioned(
//                     left: 0,
//                     right: 0,
//                     top: 0,
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(vertical: 11.h),
//                       child: LogoBar(),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 36.h,
//               ),
//               Text(
//                 "Thanks for",
//                 style: Theme.of(context).textTheme.headline1,
//                 textAlign: TextAlign.left,
//               ),
//               Text(
//                 'registration!',
//                 style: Theme.of(context).textTheme.headline1,
//                 textAlign: TextAlign.left,
//               ),
//               SizedBox(
//                 height: 18.h,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 24.w),
//                 child: RichText(
//                     textAlign: TextAlign.left,
//                     text: TextSpan(children: [
//                       TextSpan(
//                           style:
//                               Theme.of(context).textTheme.subtitle2?.copyWith(
//                                     height: 1.4.sp,
//                                   ),
//                           text:
//                               "Now you're a member of the NetCarbons community and ready to solve the global warming crisis")
//                     ])),
//               ),
//               SizedBox(
//                 height: 38.h,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   BlocProvider.of<ProductsBloc>(context)
//                       .add(ProductsEvent.started());
//
//                   selectedIndexNotifier.value = 1;
//                   Navigator.pushNamed(context, Routes.mainRoute);
//                 },
//                 child: Container(
//                   height: 91.h,
//                   width: double.maxFinite,
//                   color: AppColors.selectedGreen,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 27.w,
//                       ),
//                       SvgPicture.asset(SvgAssets.calculateWhite),
//                       SizedBox(
//                         width: 26.w,
//                       ),
//                       RichText(
//                           textAlign: TextAlign.start,
//                           text: TextSpan(children: [
//                             TextSpan(
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline2
//                                     ?.copyWith(color: AppColors.appWhite),
//                                 text:
//                                     "I want to calculate my carbon \nfootprint")
//                           ])),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 18.h,
//               ),
//               GestureDetector(
//                 onTap: () {
//                   BlocProvider.of<ProductsBloc>(context)
//                       .add(const ProductsEvent.started());
//                   selectedIndexNotifier.value = 0;
//                   Navigator.pushNamed(
//                     context,
//                     Routes.mainRoute,
//                   );
//                 },
//                 child: Container(
//                   height: 91.h,
//                   width: double.maxFinite,
//                   color: AppColors.blueFab,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: 27.w,
//                       ),
//                       SvgPicture.asset(SvgAssets.allProductsIconWhite),
//                       SizedBox(
//                         width: 26.w,
//                       ),
//                       RichText(
//                           textAlign: TextAlign.start,
//                           text: TextSpan(children: [
//                             TextSpan(
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline2
//                                     ?.copyWith(color: AppColors.appWhite),
//                                 text:
//                                     "I want to explore emission \nreduction projects")
//                           ])),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
