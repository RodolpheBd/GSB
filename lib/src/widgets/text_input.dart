import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;
  final bool? showObscureText;
  final Widget? suffixIcon;

  const CustomTextInput({
    super.key,
    this.placeholder,
    this.controller,
    this.showObscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppDimensions.widgetSmallHeight,
        width: AppDimensions.widgetWidth,
        child: TextField(
          controller: controller,
          obscureText: showObscureText ?? false,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: AppTextStyles.body,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blackColor,
                width: AppDimensions.borderThickness,
              ),
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.blackColor,
                width: AppDimensions.borderThickness,
              ),
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
            ),
            suffixIcon: suffixIcon,
          ),
          style: AppTextStyles.body,
        ),
      );
}
