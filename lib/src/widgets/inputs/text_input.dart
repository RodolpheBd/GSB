import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class CustomTextInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final bool? obscureText;

  const CustomTextInput({
    super.key,
    required this.placeholder,
    this.controller,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppDimensions.widgetSmallHeight,
        width: AppDimensions.widgetWidth,
        child: TextField(
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyles.body,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorStyles.blackColor,
                width: AppDimensions.borderThickness,
              ),
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorStyles.blackColor,
                width: AppDimensions.borderThickness,
              ),
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
            ),
          ),
          style: TextStyles.body,
        ),
      );
}
