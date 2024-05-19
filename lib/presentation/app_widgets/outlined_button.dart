import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_carbons/presentation/resources/color.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    Key? key,
    required this.onTap,
    this.height = 60,
    required this.text,
    this.filled = false,
    this.outlineColor,
    this.padding,
    this.filledColor,
    this.disabled = false,
    required this.feedbackTimeText,
  }) : super(key: key);
  final VoidCallback onTap;
  final double height;
  final Widget text;
  final Widget feedbackTimeText;
  final bool filled;
  final Color? outlineColor;
  final Color? filledColor;
  final EdgeInsets? padding;
  final bool disabled;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool onFeedback = false;
  @override
  void initState() {
    super.initState();
  }

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
          !widget.disabled ? invertFeedbackValue() : null;
        },
        onLongPressEnd: (details) {
          !widget.disabled ? invertFeedbackValue() : null;
        },
        onTap: () {
          if (!widget.disabled) {
            widget.onTap();
            swapToFeedback();
          }
        },
        child: Container(
            width: double.maxFinite,
            padding: widget.padding,
            decoration: BoxDecoration(
                color: widget.disabled
                    ? AppColors.disabledBtn
                    : onFeedback
                        ? widget.filled
                            ? Colors.white
                            : AppColors.primaryActiveColor
                        : widget.filled
                            ? widget.filledColor ?? AppColors.primaryActiveColor
                            : Colors.white,
                border: onFeedback
                    ? !widget.filled
                        ? null
                        : Border.all(
                            color: widget.outlineColor ??
                                AppColors.appGreyColor.withOpacity(1),
                            width: 1)
                    : !widget.filled
                        ? Border.all(
                            color: widget.outlineColor != null
                                ? widget.outlineColor!
                                : AppColors.appGreyColor.withOpacity(1),
                            width: 1)
                        : null),
            height: widget.height,
            child: Center(
                child: onFeedback ? widget.feedbackTimeText : widget.text)));
  }
}

class AppButton2 extends StatefulWidget {
  const AppButton2({
    Key? key,
    required this.onTap,
    this.height = 60,
    required this.text,
    this.filled = false,
    this.outlineColor,
    this.padding,
    this.filledColor,
    this.disabled = false,
    required this.feedbackTimeText,
    required this.isLoading,
  }) : super(key: key);
  final VoidCallback onTap;
  final double height;
  final Widget text;
  final Widget feedbackTimeText;
  final bool filled;
  final Color? outlineColor;
  final Color? filledColor;
  final EdgeInsets? padding;
  final bool isLoading;
  final bool disabled;

  @override
  State<AppButton2> createState() => _AppButton2State();
}

class _AppButton2State extends State<AppButton2> {
  bool onFeedback = false;
  @override
  void initState() {
    super.initState();
  }

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
    if (widget.isLoading) {
      return;
    }
    Future.delayed(const Duration(milliseconds: 100), () {
      invertFeedbackValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    onFeedback = widget.isLoading;
    return GestureDetector(
      onLongPress: () {
        !widget.disabled ? invertFeedbackValue() : null;
      },
      onLongPressEnd: (details) {
        !widget.disabled ? invertFeedbackValue() : null;
      },
      onTap: () {
        if (!widget.disabled) {
          if (widget.isLoading) {
            return;
          }
          swapToFeedback();
          widget.onTap();
        }
      },
      child: Container(
        width: double.maxFinite,
        padding: widget.padding,
        decoration: BoxDecoration(
            color: widget.disabled
                ? AppColors.disabledBtn
                : onFeedback
                    ? widget.filled
                        ? Colors.white
                        : AppColors.primaryActiveColor
                    : widget.filled
                        ? widget.filledColor ?? AppColors.primaryActiveColor
                        : Colors.white,
            border: onFeedback
                ? !widget.filled
                    ? null
                    : Border.all(
                        color: widget.outlineColor ??
                            AppColors.appGreyColor.withOpacity(1),
                        width: 1)
                : !widget.filled
                    ? Border.all(
                        color: widget.outlineColor != null
                            ? widget.outlineColor!
                            : AppColors.appGreyColor.withOpacity(1),
                        width: 1)
                    : null),
        height: widget.height,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              onFeedback ? widget.feedbackTimeText : widget.text,
              widget.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
