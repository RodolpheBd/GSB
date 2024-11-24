import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/imports.dart';

class CoffeeFeesScreen extends StatelessWidget {
  const CoffeeFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Fees(
            title: 'Café',
            icon: AppIcons.coffee,
            textInput: 'Saisir café(s)',
          ),
        ),
      );
}
