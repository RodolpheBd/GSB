import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/imports.dart';

class CateringFeesScreen extends StatelessWidget {
  const CateringFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Fees(
            title: 'Restauration',
            icon: AppIcons.catering,
            textInput: 'Saisir repas',
          ),
        ),
      );
}
