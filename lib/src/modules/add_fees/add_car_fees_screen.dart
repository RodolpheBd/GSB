import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/widgets.dart';

class AddCarFeesScreen extends StatelessWidget {
  const AddCarFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: AddFees(
            title: 'Déplacement',
            icon: AppIcons.car,
            textInput: 'Saisir km(s)',
          ),
        ),
      );
}
