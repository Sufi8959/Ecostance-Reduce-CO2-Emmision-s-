import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/shimmer_container.dart';

class HomeProductsSekeleton extends StatelessWidget {
  const HomeProductsSekeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: ListView(
        children: const [ProductCardSkeleton(), ProductCardSkeleton()],
      ),
    );
  }
}

class ProductCardSkeleton extends StatelessWidget {
  const ProductCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    var cardHeight = 285.h;

    return MyShimmerContainer(
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        height: cardHeight,
        margin: EdgeInsets.symmetric(vertical: 8.h),
        child: Container(
          width: double.maxFinite,
          height: 169.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 28.h,
                width: 200.w,
                color: Colors.black,
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 28.h,
                width: 180.w,
                color: Colors.orange,
              ),
              SizedBox(
                height: 11.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
