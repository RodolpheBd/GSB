import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/imports.dart';

class CarFeesScreen extends StatelessWidget {
  const CarFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Fees(
            title: 'Déplacement',
            icon: AppIcons.car,
            textInput: 'Saisir km(s)',
          ),
        ),
      );
}
