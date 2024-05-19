// class TopWaveBar extends StatelessWidget {
//   const TopWaveBar({
//     Key? key,
//     required this.onBackClick,
//     this.backButton = true,
//   }) : super(key: key);
//
//   final Function onBackClick;
//   final bool backButton;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//             width: double.maxFinite,
//             height: Sv.byHeightSize_10 * 10,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     fit: BoxFit.fitWidth,
//                     image: AssetImage(ImageAssets.topWave)))),
//         Positioned(
//           bottom: 0,
//           left: 16,
//           child: backButton
//               ? IconButton(
//                   onPressed: () {
//                     onBackClick();
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios,
//                     size: 26,
//                   ),
//                   padding: EdgeInsets.zero,
//                 )
//               : SizedBox(),
//         ),
//       ],
//     );
//   }
// }
