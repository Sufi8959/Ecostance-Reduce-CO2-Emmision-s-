// OpenContainer(
//   onClosed: (obj) {
//     calculatorSelectedPageNotifier.value = 0;
//   },
//   transitionType: ContainerTransitionType.fade,
//   transitionDuration:
//       const Duration(milliseconds: 1000),
//   closedBuilder: (BuildContext context,
//       void Function() openContainer) {
//     return GestureDetector(
//       onLongPress: () {
//         setState(() {
//           onFeedback1 = true;
//         });
//       },
//       onLongPressCancel: () {
//         setState(() {
//           onFeedback1 = false;
//         });
//       },
//       onLongPressEnd: (details) {
//         invertFeedbackValue();
//       },
//       onTap: () {
//         swapToFeedback();
//         selectedIndexNotifier.value = 1;
//         openContainer();
//       },
//       child: Container(
//         decoration: BoxDecoration(
//             color: onFeedback1
//                 ? const Color(0XFF698F63)
//                 : const Color(0XFFDAEAE6),
//             boxShadow: const [
//               BoxShadow(
//                 offset: Offset(0, 5),
//                 blurRadius: 18,
//                 color: Color.fromRGBO(0, 0, 0, .16),
//               )
//             ]),
//         height: 94.h,
//         width: double.maxFinite,
//         child: Stack(
//           children: [
//             Positioned(
//               left: 0,
//               child: SizedBox(
//                 height: 94.h,
//                 child: Image.asset(
//                   onFeedback1
//                       ? ImageAssets.bearButton1_1
//                       : ImageAssets.bearButton1,
//                   height: 94.h,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               bottom: 0,
//               left: 83.w,
//               child: Center(
//                 child: Text(
//                   "Calculate my carbon footprint",
//                   style: Theme.of(context)
//                       .textTheme
//                       .subtitle1
//                       ?.copyWith(
//                           color: onFeedback1
//                               ? AppColors.appWhite
//                               : AppColors
//                                   .primaryActiveColor,
//                           height: 1.7),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   },
//   openBuilder: (BuildContext context,
//       void Function({Object? returnValue}) action) {
//     return const MainScreen();
//   },
// ),
//////////////////////////////////////////// ////////////////////// ////////////////////// ////////////////////// //////////////////////

//////////////////////////////////////////// ////////////////////// ////////////////////// ////////////////////// //////////////////////

// OpenContainer(
//   transitionType: ContainerTransitionType.fade,
//   transitionDuration:
//       const Duration(milliseconds: 1000),
//   closedBuilder: (context, openContainer) =>
//       GestureDetector(
//     onLongPress: () {
//       setState(() {
//         onFeedback2 = true;
//       });
//     },
//     onLongPressCancel: () {
//       setState(() {
//         onFeedback2 = false;
//       });
//     },
//     onLongPressEnd: (details) {
//       invertFeedbackValue2();
//     },
//     onTap: () {
//       swapToFeedback2();
//       openContainer();
//       selectedIndexNotifier.value = 0;
//     },
//     child: Container(
//       decoration: BoxDecoration(
//           color: onFeedback2
//               ? const Color(0XFF6890AF)
//               : const Color(0XFFEFF8FF),
//           boxShadow: const [
//             BoxShadow(
//               offset: Offset(0, 5),
//               blurRadius: 18,
//               color: Color.fromRGBO(0, 0, 0, .16),
//             )
//           ]),
//       height: 94.h,
//       width: double.maxFinite,
//       child: Stack(
//         children: [
//           Positioned(
//             left: 0,
//             child: SizedBox(
//               height: 94.h,
//               child: Image.asset(
//                 onFeedback2
//                     ? ImageAssets.bearButton2_1
//                     : ImageAssets.bearButton2,
//                 height: 94.h,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 9.w,
//           ),
//           Positioned(
//             top: 0,
//             bottom: 0,
//             left: 82.w,
//             right: 10.w,
//             child: Center(
//               child: Text(
//                 "Select carbon reducing products",
//                 style: Theme.of(context)
//                     .textTheme
//                     .subtitle1
//                     ?.copyWith(
//                         color: onFeedback2
//                             ? AppColors.appWhite
//                             : AppColors
//                                 .primaryActiveColor,
//                         height: 1.7,
//                         fontSize: 15.sp),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
//   openBuilder: (BuildContext context,
//       void Function({Object? returnValue}) action) {
//
//     return const MainScreen();
//   },
//   onClosed: (data){
//     print(data);
//   },
// ),