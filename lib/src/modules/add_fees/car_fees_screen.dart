import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/widgets.dart';

class AddCarFeesScreen extends StatelessWidget {
  const AddCarFeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.whiteColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.paddingTop),
          child: AddFees(
            title: 'Déplacement',
            icon: AppIcons.car,
            textInput: 'Saisir km(s)',
          ),
        ),
      ),
    );
  }
}