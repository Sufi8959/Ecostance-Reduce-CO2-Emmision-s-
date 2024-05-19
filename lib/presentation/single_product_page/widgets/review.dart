import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/single_product_page/bloc/product_details_bloc.dart';

import 'expanded_review.dart';

class ReviewBuilder extends StatelessWidget {
  ReviewBuilder({
    Key? key,
    required this.productId,
    required this.state,
    required this.controller,
  }) : super(key: key);
  final String productId;
  final ProductDetailsState state;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return state.currentProductReviews.isEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("No Reviews"),
            ],
          )
        : ListView.separated(
            controller: controller,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => ExpandedReviews(
                  reviewModal: state.currentProductReviews[index],
                ),
            separatorBuilder: (context, index) => Divider(
                  color: AppColors.lightGrey,
                  thickness: 1.h,
                ),
            itemCount: state.currentProductReviews.length);
  }
}
