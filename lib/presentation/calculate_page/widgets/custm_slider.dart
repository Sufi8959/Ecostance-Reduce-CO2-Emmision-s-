//
// class AppSlider extends StatelessWidget {
//   const AppSlider(
//       {Key? key,
//       required this.label,
//       required this.onChanged,
//       required this.value})
//       : super(key: key);
//   final String label;
//   final double value;
//   final Function(double newValue) onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 8, bottom: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label),
//           SliderTheme(
//             data: SliderThemeData(
//                 trackHeight: 25,
//                 thumbShape: CustomSliderThumbCircleText(
//                   thumbRadius: 15,
//                   text: value,
//                   trackHeight: 25,
//                 ),
//                 overlayShape: SliderComponentShape.noOverlay,
//                 inactiveTrackColor: AppColors.appGreyColor.withOpacity(.5),
//                 activeTrackColor: AppColors.appGreyColor.withOpacity(.5),
//                 valueIndicatorColor: Colors.transparent,
//                 activeTickMarkColor: AppColors.appGreyColor,
//                 inactiveTickMarkColor: AppColors.appGreyColor,
//                 valueIndicatorShape: SliderComponentShape.noThumb
//                 // trackShape: CustomTracShape(trackHeight: 25, min: 0, max: 100),
//
//                 ),
//             child: Slider(
//               focusNode: FocusNode(),
//               divisions: 2,
//               value: value,
//               onChanged: onChanged,
//               max: 3,
//               min: 1,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               Text("Low"),
//               Text("Medium"),
//               Text("High"),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

Map<double, int> valueAsKey = {1.15: 0, 1: 1, 0.85: 2};

int giveValueAndGetIndex(double val) => valueAsKey[val] ?? 1;

Map<double, double> indexAsKey = {
  0: 1.15,
  1: 1,
  2: 0.85,
};
