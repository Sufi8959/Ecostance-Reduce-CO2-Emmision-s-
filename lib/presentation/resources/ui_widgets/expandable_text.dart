import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:net_carbons/presentation/resources/color.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final double textHeight;
  final Function? onExpand;
  final TextStyle textStyle;
  ExpandableText({
    Key? key,
    required this.text,
    required this.textHeight,
    this.onExpand,
    required this.textStyle,
  }) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > widget.textHeight.toInt()) {
      firstHalf = widget.text.substring(0, widget.textHeight.toInt());
      secondHalf = widget.text
          .substring(widget.textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double heigth = MediaQuery.of(context).size.height;
    return Container(
      //  height: 600,
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: widget.textStyle,
            )
          : Column(
              children: [
                hiddenText
                    ? Text(
                        firstHalf + '...',
                        style: widget.textStyle,
                      )
                    : Text(
                        firstHalf + secondHalf,
                        style: widget.textStyle,
                      ),
                InkWell(
                  onTap: () {
                    widget.onExpand?.call();
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      hiddenText
                          ? Text(
                              'LEARN MORE',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline),
                            )
                          : Text(
                              'SHOW LESS',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      color: AppColors.primaryActiveColor,
                                      fontSize: 14.sp,
                                      decoration: TextDecoration.underline),
                            ),
                      hiddenText
                          ? const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.primaryActiveColor,
                            )
                          : const Icon(
                              Icons.arrow_drop_up,
                              color: AppColors.primaryActiveColor,
                            )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class SmallText extends StatelessWidget {
  SmallText(
      {required this.text,
      this.color = const Color(0xFF5c524f),
      this.size = 12,
      this.textOverflow = TextOverflow.ellipsis,
      this.lineHeight = 1.2});
  final String text;
  Color? color;
  double size;
  TextOverflow textOverflow;
  double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        color: color,
        height: lineHeight,
      ),
      overflow: textOverflow,
    );
  }
}
