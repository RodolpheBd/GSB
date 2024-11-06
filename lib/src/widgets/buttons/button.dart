import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isBlackBackground;
  final VoidCallback onPressed;

  const CustomButton({
    super.key, 
    required this.text,
    required this.isBlackBackground,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.widgetSmallHeight,
      width: AppDimensions.widgetWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isBlackBackground ? ColorStyles.blackColor : ColorStyles.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusSmall),
            side: BorderSide(
              color: isBlackBackground ? ColorStyles.blackColor : ColorStyles.whiteColor,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyles.bodyBold(isBlackBackground),
        ),
      ),
    );
  }
}
