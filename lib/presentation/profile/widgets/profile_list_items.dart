import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/color.dart';

class ProfileListItem extends StatefulWidget {
  final Widget icon;
  final Widget iconFeedback;
  final String text;
  final Function onTap;
  final Widget? trailing;
  const ProfileListItem({
    super.key,
    this.icon = const SizedBox(),
    required this.text,
    required this.onTap,
    this.trailing,
    this.iconFeedback = const SizedBox(),
  });

  @override
  State<ProfileListItem> createState() => _ProfileListItemState();
}

class _ProfileListItemState extends State<ProfileListItem> {
  bool onFeedback = false;
  swapToFeedback() {
    invertFeedbackValue();
    backToNormal();
  }

  void invertFeedbackValue() {
    if (mounted) {
      setState(() {
        onFeedback = !onFeedback;
      });
    }
  }

  void backToNormal() {
    Future.delayed(const Duration(milliseconds: 100), () {
      invertFeedbackValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        invertFeedbackValue();
      },
      onLongPressEnd: (details) {
        invertFeedbackValue();
      },
      onTap: () {
        swapToFeedback();
        widget.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 16.w),
        decoration: BoxDecoration(
            color:
                onFeedback ? AppColors.primaryActiveColor : AppColors.appWhite,
            border: Border(
                bottom: BorderSide.lerp(
                    const BorderSide(color: AppColors.appGreyColor),
                    const BorderSide(color: AppColors.appGreyColor),
                    1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
                width: 20.w,
                child: Center(
                    child: onFeedback ? widget.iconFeedback : widget.icon)),
            SizedBox(width: 20.w),
            Text(
              widget.text,
              style: onFeedback
                  ? Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: AppColors.appWhite)
                  : Theme.of(context).textTheme.subtitle1,
            ),
            const Expanded(child: SizedBox()),
            widget.trailing ?? SizedBox()
          ],
        ),
      ),
    );
  }
}
