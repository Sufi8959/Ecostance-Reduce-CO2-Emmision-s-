import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../resources/color.dart';

class InputField extends StatefulWidget {
  InputField(
      {Key? key,
      this.textInputAction = TextInputAction.next,
      required this.textEditingController,
      this.obscureText = false,
      this.suffixIcon,
      this.inputType = TextInputType.text,
      required this.label,
      required this.hintText,
      this.fieldKey,
      this.errorText = '',
      this.validator,
      this.enabled = true,
      this.inputFormatters,
      this.autoCorrect = true,
      this.suggestBer = true,
      this.onChanged,
      this.onEditingComplete,
      required this.onUnfocused,
      required this.onFocused,
      this.focusNode,
      this.maxLines = 1})
      : super(key: key);
  final TextEditingController textEditingController;
  final bool obscureText;
  final IconData? suffixIcon;
  final TextInputType inputType;
  final String label;
  final String hintText;
  final GlobalKey<FormFieldState>? fieldKey;
  final String errorText;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool autoCorrect;
  final bool suggestBer;
  final Function? onEditingComplete;
  final Function onUnfocused;
  final Function onFocused;
  ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final int maxLines;
  final TextInputAction textInputAction;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;
  @override
  void initState() {
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(_onFocusChange);
    }
    super.initState();
  }

  void _onFocusChange() {
    if (!widget.focusNode!.hasFocus) {
      widget.onUnfocused();
    } else if (widget.focusNode!.hasFocus) {
      widget.onFocused();
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChange);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   widget.label,
        //   style: Theme.of(context)
        //       .textTheme
        //       .subtitle1
        //       ?.copyWith(color: AppColors.primaryActiveColor),
        // ),
        TextFormField(
          textInputAction: widget.textInputAction,
          focusNode: widget.focusNode,
          onTap: () {},
          onEditingComplete: () => widget.onEditingComplete,
          onChanged: (val) {
            if (widget.onChanged == null) return;
            widget.onChanged!(val);
          },
          enableSuggestions: widget.suggestBer,
          autocorrect: widget.autoCorrect,
          inputFormatters: widget.inputFormatters,
          key: widget.fieldKey,
          validator: widget.validator,
          controller: widget.textEditingController,
          keyboardType: widget.inputType,
          obscureText: widget.obscureText ? hidePassword : false,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 16.sp, color: AppColors.primaryActiveColor),
          decoration: InputDecoration(
            enabledBorder: null,
            errorStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: 12.sp, color: AppColors.redAccent),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              child: Icon(
                color: AppColors.primaryActiveColor,
                hidePassword
                    ? widget.suffixIcon
                    : widget.suffixIcon != null
                        ? Icons.remove_red_eye_outlined
                        : null,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.appGreyColor),
          ),
          enabled: widget.enabled,
          maxLines: widget.maxLines,
        ),
      ],
    );
  }
}
