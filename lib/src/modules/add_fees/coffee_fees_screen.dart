import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/widgets.dart';

class AddCoffeeFeesScreen extends StatelessWidget {
  const AddCoffeeFeesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.paddingTop),
          child: AddFees(
            title: 'Café',
            icon: AppIcons.coffee,
            textInput: 'Saisir café(s)',
          ),
        ),
      ),
    );
  }
}