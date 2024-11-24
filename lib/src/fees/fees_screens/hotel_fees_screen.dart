import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/imports.dart';

class HotelFeesScreen extends StatelessWidget {
  const HotelFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Fees(
            title: 'Hébergement',
            icon: AppIcons.hotel,
            textInput: 'Saisir nuit(s)',
          ),
        ),
      );
}
