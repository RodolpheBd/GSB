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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          title,
          style: TextStyles.header,
        ),
        centerTitle: true,
      ),
      backgroundColor: ColorStyles.whiteColor,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.gapMedium),
            CustomCard(
              icon: icon,
              height: AppDimensions.widgetMediumHeight,
              width: AppDimensions.widgetWidth,
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
        ),
      ),
    );
  }
}