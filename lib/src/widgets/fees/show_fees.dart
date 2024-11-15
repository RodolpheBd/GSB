import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class ShowFees extends StatelessWidget {
  final String title;
  final Image? image;
  final String date;
  final String number;
  final String price;
  final bool repay;

  const ShowFees({
    super.key,
    required this.title,
    this.image,
    required this.date,
    required this.number,
    required this.price,
    required this.repay,
  });

  @override
Widget build(BuildContext context) => Scaffold(
      appBar: HeaderNavBar(
        showBackArrow: true,
        title: title,
        backgroundColor: repay ? ColorStyles.greenColor : ColorStyles.redColor, 
      ),
      body: Container(
        color: repay ? ColorStyles.greenColor : ColorStyles.redColor,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: AppDimensions.gapMedium),
              image != null ? image! : const SizedBox(),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                value: TextEditingController(text: date),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                value: TextEditingController(text: number),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomTextInput(
                value: TextEditingController(text: price),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomButton(text: 'Supprimer', textColor: repay ? ColorStyles.greenColor : ColorStyles.redColor,onPressed: () {}),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomButton(text: 'Valider', textColor: repay ? ColorStyles.greenColor : ColorStyles.redColor, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
}
