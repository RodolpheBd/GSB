import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final VoidCallback onPressed;
  final bool? isLoading;

  const CustomButton({
    super.key,
    required this.text,
    this.textColor,
    required this.onPressed,
    this.isLoading
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppDimensions.widgetSmallHeight,
        width: AppDimensions.widgetWidth,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blackColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            shadowColor: Colors.transparent,
          ),
          child: (isLoading ?? false)
              ? const CircularProgressIndicator(
                  color: AppColors.whiteColor,
                )
              : Text(
                  text,
                  style: AppTextStyles.bodyBold.copyWith(
                    color: textColor ?? AppColors.whiteColor,
                  ),
                ),
        ),
      );
}
