// import 'package:flutter/material.dart';
// import 'package:net_carbons/presentation/home-products/widgets/sort_sheet_widget.dart';
//
// class HomeHeader extends StatelessWidget {
//   const HomeHeader({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Expanded(
//               child: Text(
//             'Carbon Offers',
//             style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//             ),
//           )),
//           IconButton(
//             icon: const Icon(Icons.filter_list),
//             onPressed: () {
//               buildFilterBottomSheet(context);
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.sort),
//             onPressed: () {
//               buildSortBottomSheet(context);
//             },
//           ),
//           TextButton(
//             onPressed: () {},
//             child: const Text(
//               'Clear',
//               style: TextStyle(
//                 color: Colors.grey,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void buildFilterBottomSheet(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     showModalBottomSheet(
//         backgroundColor: Color.fromRGBO(94, 94, 92, 0.1),
//         context: context,
//         builder: (context) => Container(
//               width: width,
//               height: height / 2,
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30))),
//             ));
//   }
//
//   void buildSortBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//         backgroundColor: Color.fromRGBO(94, 94, 92, 0.1),
//         context: context,
//         builder: (context) => SortSheetWidget());
//   }
// }
