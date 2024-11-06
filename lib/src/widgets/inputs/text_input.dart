import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class CustomTextInput extends StatelessWidget {
  final String placeholder;

  const CustomTextInput({
    super.key, 
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppDimensions.widgetSmallHeight,
          width: AppDimensions.widgetWidth,
          child: TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyles.body,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppDimensions.borderRadiusSmall)),
                borderSide: BorderSide(
                  color: ColorStyles.blackColor,
                  width: AppDimensions.borderThickness,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppDimensions.borderRadiusSmall)),
                borderSide: BorderSide(
                  color: ColorStyles.blackColor, 
                  width: AppDimensions.borderThickness,
                ),
              ),
            ),
            style: TextStyles.body
          ),
        ),
      ],
    );
  }
}
