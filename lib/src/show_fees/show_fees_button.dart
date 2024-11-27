import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';

class ShowFeesButton extends StatelessWidget {
  final String title;
  final String date;
  final String price;
  final bool repay;
  final VoidCallback onPressed;

  const ShowFeesButton(
      {super.key,
      required this.title,
      required this.date,
      required this.price,
      required this.repay,
      required this.onPressed});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppDimensions.widgetMediumHeight,
        width: AppDimensions.widgetWidth,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                repay ? AppColors.greenColor : AppColors.redColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
              side: BorderSide(
                color: AppColors.blackColor,
                width: AppDimensions.borderThickness,
              ),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            shadowColor: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyBold.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  Text(
                    date,
                    style: AppTextStyles.bodyBold.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: AppTextStyles.bodyBold.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
