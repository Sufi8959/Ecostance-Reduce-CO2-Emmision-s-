import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/color.dart';
import 'package:net_carbons/presentation/resources/ui_widgets/top_wave.dart';

import '../bloc/checkout_bloc.dart';

class CheckoutAppBar extends StatelessWidget {
  const CheckoutAppBar({
    Key? key,
    required this.title,
    required this.actionText,
  }) : super(key: key);
  final String title;
  final String actionText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopWave(
          height: 80.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: AppBar(
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(color: AppColors.primaryActiveColor),
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              bottom: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        'Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(color: AppColors.primaryActiveColor),
                      ),
                      onPressed: () {
                        BlocProvider.of<CheckoutBloc>(context)
                            .add(const CheckoutEvent.cancelled());

                        Navigator.pop(context);
                      }),
                  Text(
                    actionText,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: AppColors.primaryActiveColor),
                  ),
                ],
              ),
            ),
            actions: [],
          ),
        ),
      ],
    );
  }
}
