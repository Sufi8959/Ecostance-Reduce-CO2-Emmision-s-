import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:net_carbons/domain/product/modal/review_modals.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/expandable_text.dart';
import 'package:net_carbons/presentation/single_product_page/widgets/ratings.dart';

class ExpandedReviews extends StatelessWidget {
  const ExpandedReviews({
    super.key,
    required this.reviewModal,
    this.iso3Code = 'usa',
  });
  final ReviewModal reviewModal;
  final String iso3Code;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 25.sp,
            foregroundImage:
                NetworkImage(reviewModal.customer.user.profileImage),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Ratings(
                    rating: reviewModal.approvedRating,
                    ratingCount: 5,
                    size: 15.h,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "${reviewModal.customer.user.firstName} ${reviewModal.customer.user.lastName}",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            fontSize: 16, color: AppColors.primaryActiveColor),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(DateFormat('yyyy-MM-dd')
                          .format(reviewModal.createdAt))
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ExpandableText(
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: AppColors.primaryActiveColor),
                    text: reviewModal.approvedComment,
                    textHeight: 50.h,
                  )
                ],
              ),
            ),
          )
        ]);
  }
}
