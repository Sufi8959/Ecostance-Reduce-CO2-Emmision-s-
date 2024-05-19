import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/checkout/bloc/checkout_bloc.dart';

import '../../../app/constants/string_constants.dart';
import '../../app_widgets/outlined_button.dart';
import '../../resources/color.dart';

Future<void> showAddMoreDialog({
  required BuildContext mainCtx,
  required int difference,
  required int totalAmount,
}) async {
  BlocProvider.of<CheckoutBloc>(mainCtx)
      .add(const CheckoutEvent.changeEmissionPopupStatus(newStatus: false));
  return showDialog<void>(
    context: mainCtx,
    barrierDismissible: true, // user must tap button!
    builder: (context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          color: AppColors.appWhite,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // SvgPicture.asset(SvgAssets.escMark),
                SizedBox(
                  height: 24.h,
                ),
                Transform.scale(
                  scale: 1.5,
                  child: Icon(
                    Icons.error_outlined,
                    size: 56.sp,
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),

                // You have {totalAmount - remainingAmount} carbon offsets in your cart,
                // but you had chosen {totalAmount} carbon offsets to reduce your carbon
                // footprint by. Do you want to add {remainingAmount} more units?
                Text(
                  """You have ${totalAmount - difference} carbon offsets in your cart, but you had chosen $totalAmount carbon offsets to reduce your carbon footprint by. Do you want to add $difference more units?""",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: AppColors.primaryActiveColor,
                      height: 1.3,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 40.h,
                ),
                AppButton(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(mainCtx);
                  },
                  text: Text(
                    ButtonStrings.okAddMore,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  filled: true,
                  feedbackTimeText: Text(
                    ButtonStrings.okAddMore,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.primaryActiveColor),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                AppButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  text: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      ButtonStrings.checkoutNow,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: AppColors.primaryActiveColor),
                    ),
                  ),
                  feedbackTimeText: Text(
                    ButtonStrings.checkoutNow,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.appWhite),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
