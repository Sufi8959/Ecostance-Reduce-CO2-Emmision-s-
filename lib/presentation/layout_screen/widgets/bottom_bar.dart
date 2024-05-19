import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';

ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

ValueNotifier<List<int>> pageHistory = ValueNotifier<List<int>>([0]);

class BottomNavigationWdget extends StatelessWidget {
  const BottomNavigationWdget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, int newValue, Widget? _) {
        return BottomNavigationBar(
          elevation: 0,
          onTap: (value) {
            pageHistory.value.add(value);
            selectedIndexNotifier.value = value;
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: newValue,
          selectedItemColor: AppColors.primaryActiveColor,
          unselectedItemColor: AppColors.appGreyColor,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: SizedBox(
                    width: 24.w,
                    child: SvgPicture.asset(newValue == 0
                        ? SvgAssets.allProductsIconActive
                        : SvgAssets.allProductsIcon)),
                label: "All Products"),
            BottomNavigationBarItem(
                icon: SizedBox(
                    width: 24.w,
                    child: SvgPicture.asset(newValue == 1
                        ? SvgAssets.calculateIconActive
                        : SvgAssets.calculateIcon)),
                label: "Calculate"),
            BottomNavigationBarItem(
                icon: SizedBox(
                    width: 24.w,
                    child: Icon(
                      Icons.search,
                      color: newValue == 2
                          ? AppColors.primaryActiveColor
                          : AppColors.appGreyColor,
                    )),
                label: "Search"),
            BottomNavigationBarItem(
                icon: SizedBox(
                    width: 24.w,
                    child: SvgPicture.asset(newValue == 3
                        ? SvgAssets.personIconActive
                        : SvgAssets.personIcon)),
                label: "Account"),
          ],
        );
      },
      valueListenable: selectedIndexNotifier,
    );
  }
}
