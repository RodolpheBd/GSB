import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class CustomCard extends StatelessWidget {
  final String icon;
  final String? text;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  const CustomCard({
    super.key,
    required this.icon,
    this.text,
    required this.height,
    required this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Ajout de l'interaction
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: ColorStyles.blackColor,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: text != null ? AppDimensions.iconLarge : AppDimensions.iconMedium,
              width: text != null ? AppDimensions.iconLarge : AppDimensions.iconMedium,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: AppDimensions.gapSmall),
            if (text != null)
              Text(
                text!,
                style: TextStyles.firstTitle.copyWith(color: ColorStyles.whiteColor),
              ),
          ],
        ),
      ),
    );
  }
}
