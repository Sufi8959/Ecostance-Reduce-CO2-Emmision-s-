import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar_1/flutter_rating_bar_1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:net_carbons/app/util_functions/getPriceFormatted.dart';
import 'package:net_carbons/domain/user_profile/modal/my_orders_list.dart';
import 'package:net_carbons/presentation/app_widgets/outlined_button.dart';
import 'package:net_carbons/presentation/profile/bloc/user_profile_bloc.dart';
import 'package:net_carbons/presentation/resources/assets.dart';
import 'package:net_carbons/presentation/resources/color.dart';

class AddReviewPopUp extends StatelessWidget {
  AddReviewPopUp({
    Key? key,
    required this.textTheme,
    required this.orderModal,
  }) : super(key: key);

  final TextTheme textTheme;
  final OrderFetchModal orderModal;

  PageController pageController = PageController();
  TextEditingController textEditingController = TextEditingController();

  _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
    Future.delayed(const Duration(seconds: 1), () {
      BlocProvider.of<UserProfileBloc>(context)
          .add(const UserProfileEvent.setSnackBar(false, ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    // textEditingController.addListener(() {
    //   BlocProvider.of<UserProfileBloc>(context)
    //       .add(UserProfileEvent.setReviewComment(textEditingController.text));
    // });
    BlocProvider.of<UserProfileBloc>(context)
        .add(const UserProfileEvent.changePage(ProfileCurrPage.review));
    BlocProvider.of<UserProfileBloc>(context).add(
        UserProfileEvent.setProductToReview(
            productId: orderModal.products.first.id, orderId: orderModal.id));
    return BlocConsumer<UserProfileBloc, UserProfileState>(
      listenWhen: (prev, curr) =>
          curr.profileCurrPage == ProfileCurrPage.review,
      listener: (context, state) {
        if (state.postReviewStatus == PostReviewStatus.alreadyAdded ||
            state.postReviewStatus == PostReviewStatus.error) {
          if (state.showASnackBar) {
            _showSnackBar(
                context, state.postReviewErrorMessage ?? 'Unable to post');
          }
          Navigator.pop(context);
        }
        if (state.postReviewStatus == PostReviewStatus.success) {
          if (state.showASnackBar) {
            _showSnackBar(context, "Review Added");
          }

          // Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.postReviewInProgress,
          child: SizedBox(
            height: 400.h,
            width: 344.w,
            child: Column(
              children: [
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  height: 35.h,
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${state.reviewAction == ReviewAction.update ? "Edit" : "Add"} review",
                        style: textTheme.headline1,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                Expanded(
                    child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    Column(
                      children: [
                        Divider(),
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ReviewPopUpProduct(
                                orderProductElementModal:
                                    orderModal.products[index],
                                currency: orderModal.currency,
                                currencySymbol: orderModal.currencySymbol,
                                radioValue: orderModal.products[index].id,
                                onChanged: (newValue) {
                                  if (newValue == null) return;
                                  BlocProvider.of<UserProfileBloc>(context).add(
                                      UserProfileEvent.setProductToReview(
                                          productId: newValue,
                                          orderId: orderModal.id));
                                },
                                groupValue: state.selectedProductIdToReview,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 1,
                                height: 2,
                              );
                            },
                            itemCount: orderModal.products.length,
                            shrinkWrap: true,
                          ),
                        ),
                        Divider(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 36.h),
                          child: SizedBox(
                              width: 125.w,
                              height: 52.h,
                              child: AppButton(
                                filled: true,
                                onTap: () {
                                  BlocProvider.of<UserProfileBloc>(context).add(
                                      UserProfileEvent.getCurrentReview(
                                          productId:
                                              state.selectedProductIdToReview,
                                          orderId:
                                              state.selectedOrderIdToReview));
                                  pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.easeIn);
                                },
                                text: Text(
                                  'Next',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                feedbackTimeText: Text(
                                  'Next',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                          color: AppColors.primaryActiveColor),
                                ),
                              )),
                        )
                      ],
                    ),
                    ReviewView(
                      textEditingController: textEditingController,
                      orderModal: orderModal,
                      userProfileState: state,
                    )
                  ],
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ReviewView extends StatefulWidget {
   ReviewView({
    Key? key,
    required this.textEditingController,
    required this.orderModal,
    required this.userProfileState,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final OrderFetchModal orderModal;
  final UserProfileState userProfileState;

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {

  bool hasStarErr=false;

  @override
  void initState() {
    widget.textEditingController.text = widget.userProfileState.reviewComment ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Your Rating",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 14.h,
                ),
                RatingBar.builder(
                  allowUpdate: true,
                  tapOnlyMode: true,
                  initialRating: state.reviewCount,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  unratedColor: AppColors.lightGrey,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) =>
                      SvgPicture.asset(SvgAssets.starActive),
                  onRatingUpdate: (rating) {
                    BlocProvider.of<UserProfileBloc>(context)
                        .add(UserProfileEvent.setReviewCount(rating));
                  },
                  itemSize: 27.h,
                ),
                if(hasStarErr)
                state.reviewCount <= 0
                    ? Text(
                        'Rating must be selected',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: AppColors.cherryRed),
                      )
                    : SizedBox(),
                SizedBox(
                  height: 35.h,
                ),
                TextField(
                  controller: widget.textEditingController,
                  maxLines: 4,
                  decoration: const InputDecoration(hintText: 'You review'),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Center(
                  child: SizedBox(
                      width: 125.w,
                      height: 52.h,
                      child: AppButton(
                        filled: true,
                        onTap: () {
                          if (state.reviewCount <= 0) {
                            setState(() {
                              hasStarErr=true;
                            });
                            return;
                          }
                          if (state.reviewAction == ReviewAction.create) {
                            BlocProvider.of<UserProfileBloc>(context).add(
                                UserProfileEvent.postAReview(
                                    ratingCount: state.reviewCount,
                                    comment: widget.textEditingController.text.trim(),
                                    productId: state.selectedProductIdToReview,
                                    orderId: widget.orderModal.id));
                          } else if (state.reviewAction ==
                              ReviewAction.update) {
                            if (state.reviewToUpdateId == null) {
                              return;
                            }
                            BlocProvider.of<UserProfileBloc>(context).add(
                                UserProfileEvent.updateReview(
                                    ratingCount: state.reviewCount,
                                    comment: widget.textEditingController.text.trim(),
                                    reviewId: state.reviewToUpdateId!));
                          }
                          Navigator.pop(context);
                        },
                        text: Text(
                          'Submit',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        feedbackTimeText: Text(
                          'Submit',
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: AppColors.primaryActiveColor),
                        ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class ReviewPopUpProduct extends StatelessWidget {
  const ReviewPopUpProduct({
    Key? key,
    required this.orderProductElementModal,
    required this.currency,
    required this.currencySymbol,
    required this.radioValue,
    required this.onChanged,
    required this.groupValue,
  }) : super(key: key);

  final OrderProductElementModal orderProductElementModal;
  final String currency;
  final String currencySymbol;
  final String radioValue;
  final Function(String?) onChanged;
  final String groupValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      height: 165.h,
      width: 343.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRadioWidget<String>(
            value: radioValue,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
          Container(
            width: 75.w,
            height: 91.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        orderProductElementModal.product.image.first))),
          ),
          SizedBox(
            height: 150.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(orderProductElementModal.product.name),
                Text(getPriceFormattedWithCODE(
                  currency,
                  orderProductElementModal.price,
                )),
                SizedBox(
                    width: 190.w,
                    child: Text(
                      orderProductElementModal.product.shortDescription,
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text(getPriceFormattedWithCODE(
                  currency,
                  orderProductElementModal.price *
                      orderProductElementModal.quantity,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomRadioWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double width;
  final double height;

  const CustomRadioWidget(
      {super.key,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.width = 18,
      this.height = 18});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            onChanged(value);
          },
          child: value == groupValue
              ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: SvgPicture.asset(SvgAssets.couponTickMark))
              : SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: const CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.appButtonOutline,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: AppColors.appWhite,
                      )),
                )),
    );
  }
}
