import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/shimmer_container.dart';

class CartSkeleton extends StatelessWidget {
  const CartSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, i) => Divider(
              height: 10.h,
            ),
        itemCount: 2,
        itemBuilder: (context, index) {
          return const CartListTileSkeleton();
        });
  }
}

class CartListTileSkeleton extends StatelessWidget {
  const CartListTileSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyShimmerContainer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          height: 200.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 110.h,
                      height: 110.h,
                      color: Colors.black,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8.w, bottom: 0, top: 4, right: 4),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.black,
                                height: 48.h,
                                width: double.maxFinite,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Container(
                                color: Colors.black,
                                height: 15.h,
                                width: double.maxFinite,
                              ),
                              SizedBox(
                                height: 11.h,
                              ),
                              Container(
                                color: Colors.black,
                                height: 25.h,
                                width: double.maxFinite,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h, left: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 38.h,
                      width: 100.w,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartBottomSkeleton extends StatelessWidget {
  const CartBottomSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyShimmerContainer(
      child: Container(
        padding: EdgeInsets.only(left: 22.w, top: 14.h, right: 12.w),
        height: 290.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 25.h,
              width: 94.h,
              color: Colors.black,
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 14.h, bottom: 14.h, left: 18.w, right: 11.w),
                      height: 45.h,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 19.w,
                ),
                Container(
                  color: AppColors.primaryActiveColor,
                  width: 114.w,
                  height: 45.h,
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              color: Colors.black,
              width: 150.w,
              height: 22.h,
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              color: Colors.black,
              width: 150.w,
              height: 22.h,
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              color: Colors.black,
              width: 150.w,
              height: 22.h,
            ),
            SizedBox(
              height: 4.h,
            ),
            Container(
              color: Colors.black,
              width: 150.w,
              height: 22.h,
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 60.h,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
