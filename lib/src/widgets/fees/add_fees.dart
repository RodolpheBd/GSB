import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class AddFees extends StatelessWidget {
  final String title;
  final String icon;
  final String textInput;

  const AddFees({
    super.key,
    required this.title,
    required this.icon,
    required this.textInput,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.header,
          ),
          const SizedBox(height: AppDimensions.gapMedium),
          CustomCard(
            icon: icon,
            height: AppDimensions.widgetMediumHeight,
            width: AppDimensions.widgetSmallHeight,
            
          ),
          const SizedBox(height: AppDimensions.gapSmall),
          CustomTextInput(
            placeholder: textInput,
          ),
          const SizedBox(height: AppDimensions.gapSmall),
          CustomButton(
            text: 'Télécharger une image',
            isBlackBackground: true,
            onPressed: () => (),
          ),
          const SizedBox(height: AppDimensions.gapSmall),
          CustomButton(
            text: 'Valider',
            isBlackBackground: true,
            onPressed: () => (),
          ),
        ],

    );
  }
}
