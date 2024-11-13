import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/widgets.dart';

class AddCateringFeesScreen extends StatelessWidget {
  const AddCateringFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: AddFees(
            title: 'Restauration',
            icon: AppIcons.catering,
            textInput: 'Saisir repas',
          ),
        ),
      );
}
