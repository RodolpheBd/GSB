import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppDimensions.widgetSmallHeight,
        width: AppDimensions.widgetWidth,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorStyles.blackColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
            ),
          ),
          child: Text(
            text,
            style: TextStyles.bodyBold.copyWith(
              color: ColorStyles.whiteColor,
            ),
          ),
        ),
      );
}
