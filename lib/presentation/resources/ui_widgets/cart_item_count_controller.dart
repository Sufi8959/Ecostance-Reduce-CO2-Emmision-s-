import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color.dart';

class CartItemCountTool extends StatelessWidget {
  const CartItemCountTool({
    Key? key,
    this.currentQuanity,
    this.height = 50,
    required this.onIncrement,
    required this.onDecrement,
    this.width,
    required this.iconSize,
    this.bottomBorder = true,
  }) : super(key: key);

  final int? currentQuanity;
  final double height;
  final double? width;
  final double iconSize;
  final Function onIncrement;
  final Function onDecrement;
  final bool bottomBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: bottomBorder
              ? Border(
                  bottom: BorderSide(
                      width: 2.0,
                      color: AppColors.appGreyColor.withOpacity(0.5)),
                )
              : null),
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: Icon(
                Icons.remove,
                size: iconSize,
              ),
            ),
            onTap: () {
              onDecrement();
            },
          ),
          // SizedBox(
          //   width: 20.w,
          // ),
          Text(currentQuanity.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: AppColors.primaryActiveColor)),
          // SizedBox(
          //   width: 20.w,
          // ),
          GestureDetector(
            child: SizedBox(
              width: iconSize,
              height: iconSize,
              child: Icon(
                Icons.add,
                size: iconSize,
              ),
            ),
            onTap: () {
              onIncrement();
            },
          ),
        ],
      ),
    );
  }
}

//
