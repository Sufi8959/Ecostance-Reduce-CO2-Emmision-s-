import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/shimmer_container.dart';

class ShimmerProductDetails extends StatelessWidget {
  const ShimmerProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyShimmerContainer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 338.h,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.black,
                          height: 38.h,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 25.h,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                color: Colors.black,
                                height: 25.h,
                              )),
                              SizedBox(
                                width: 23.h,
                              ),
                              Expanded(
                                  child: Container(
                                color: Colors.black,
                                height: 25.h,
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 170.h,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 160.h,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12.w, right: 12.w),
                          child: Row(
                            children: [
                              Container(
                                color: Colors.black,
                                width: 117.w,
                                height: 40.h,
                              ),
                              Spacer(),
                              Container(
                                color: Colors.black,
                                width: 60.w,
                                height: 60.h,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                color: Colors.black,
                                width: 60.w,
                                height: 60.h,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(12.w),
                          height: 50,
                          width: double.maxFinite,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
