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
                repay ? ColorStyles.greenColor : ColorStyles.redColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppDimensions.borderRadiusSmall),
              side: BorderSide(
                color: ColorStyles.blackColor,
                width: AppDimensions.borderThickness,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyles.bodyBold,
                  ),
                  Text(
                    date,
                    style: TextStyles.bodyBold,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: TextStyles.bodyBold.copyWith(
                      color: ColorStyles.whiteColor,),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
