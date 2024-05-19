import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/calculate_page/widgets/custm_slider.dart';

import '../../resources/color.dart';

class ToggleTab extends StatefulWidget {
  const ToggleTab({
    Key? key,
    required this.selectedIndex,
    required this.onChanged,
    required this.title,
  }) : super(key: key);
  final String title;
  final double selectedIndex;
  final Function(int) onChanged;

  @override
  State<ToggleTab> createState() => _ToggleTabState();
}

class _ToggleTabState extends State<ToggleTab>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int selectedIndex = 1;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedIndex = giveValueAndGetIndex(widget.selectedIndex);

    tabController.index = selectedIndex;
    return Column(
      children: [
        Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: AppColors.appGreyColor),
        ),
        SizedBox(
          height: 8.h,
        ),
        Container(
          height: 32.h,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: TabBar(
            labelPadding: EdgeInsets.zero,
            indicatorWeight: .1,
            splashBorderRadius: BorderRadius.circular(20.r),
            indicator: BoxDecoration(),
            indicatorPadding: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            indicatorColor: AppColors.selectedGreen,
            isScrollable: false,
            onTap: (index) {
              widget.onChanged(index);
              // setState(() {
              //   selectedIndex = index;
              // });
            },
            controller: tabController,
            tabs: [
              Container(
                height: 34.h,
                width: double.maxFinite,
                decoration: selectedIndex != 0
                    ? const BoxDecoration()
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.selectedGreen,
                      ),
                child: Center(
                  child: Text(
                    "High",
                    style: selectedIndex == 0
                        ? Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: AppColors.appWhite)
                        : Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColors.primaryActiveColor),
                  ),
                ),
              ),
              Container(
                height: 34.h,
                width: double.maxFinite,
                decoration: selectedIndex != 1
                    ? const BoxDecoration()
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.selectedGreen,
                      ),
                child: Center(
                  child: Text(
                    "Medium",
                    style: selectedIndex == 1
                        ? Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: AppColors.appWhite)
                        : Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColors.primaryActiveColor),
                  ),
                ),
              ),
              Container(
                height: 34.h,
                width: double.maxFinite,
                decoration: selectedIndex != 2
                    ? const BoxDecoration()
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.selectedGreen,
                      ),
                child: Center(
                  child: Text(
                    'Low',
                    style: selectedIndex == 2
                        ? Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: AppColors.appWhite)
                        : Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: AppColors.primaryActiveColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
//
// import '../../../app/ui/responsive_size.dart';
// import '../../resources/color.dart';
// import 'custm_slider.dart';
//
// class ToggleTab extends StatelessWidget {
//   const ToggleTab({
//     Key? key,
//     required this.selectedIndex,
//     required this.onChanged,
//     required this.title,
//   }) : super(key: key);
//   final String title;
//   final double selectedIndex;
//   final Function(int) onChanged;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(title),
//         SizedBox(
//           height: Sv.byHeightSize_8,
//         ),
//         FlutterToggleTab(
//           width: Sv.byWidthSize_8 * 10.5,
//           height: Sv.byHeightSize_34,
//           selectedIndex: valueAsKey[selectedIndex]!,
//           selectedBackgroundColors: const [AppColors.selectedGreen],
//           selectedTextStyle: Theme.of(context)
//               .textTheme
//               .subtitle1!
//               .copyWith(color: AppColors.appWhite),
//           unSelectedTextStyle: Theme.of(context)
//               .textTheme
//               .bodyText2!
//               .copyWith(color: AppColors.primaryActiveColor),
//           labels: ['Low', "Medium", "High"],
//           selectedLabelIndex: (index) {
//             onChanged(index);
//           },
//           isScroll: false,
//         ),
//       ],
//     );
//   }
// }
