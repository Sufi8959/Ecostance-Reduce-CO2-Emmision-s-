import 'package:flutter/material.dart';

import '../../resources/color.dart';

class RadioGroup extends StatelessWidget {
  const RadioGroup({
    Key? key,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  final double groupValue;
  final Function(double?) onChanged;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title ${groupValue.toString()}",
          style: Theme.of(context).textTheme.caption,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RadioListTile<double>(
                visualDensity: VisualDensity(horizontal: -4),
                dense: true,
                activeColor: AppColors.primaryActiveColor,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "High",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                value: 1.15,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile<double>(
                visualDensity: VisualDensity(horizontal: -4),
                dense: true,
                activeColor: AppColors.primaryActiveColor,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Medium",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                value: 1,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            Expanded(
              child: RadioListTile<double>(
                visualDensity: VisualDensity(horizontal: -4),
                dense: true,
                activeColor: AppColors.primaryActiveColor,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Low",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                value: .85,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ],
        )
      ],
    );
  }
}
