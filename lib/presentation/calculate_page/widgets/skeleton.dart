import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/shimmer_container.dart';

class CalculateViewSkeleton extends StatelessWidget {
  const CalculateViewSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyShimmerContainer(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
                child: Container(
              height: 35.h,
              color: Colors.black,
            )),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 45.h,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              height: 24.h,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 14.h,
            ),
            Container(
              height: 63.h,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              height: 12.h,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 45.h,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 14.h,
            ),
            Container(
              height: 12.h,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(height: 10.h),
            Container(
              height: 45.h,
              width: double.infinity,
              color: Colors.black,
            ),

            SizedBox(
              height: 14.h,
            ),

            ///main
            Column(
              children: [
                Container(
                  height: 45.h,
                  width: double.infinity,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Container(
                  height: 45.h,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(
              height: 27.h,
            ),
            Container(
              height: 60.h,
              width: double.infinity,
              color: Colors.black,
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    ));
  }
}
