import 'package:flutter/material.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/widgets.dart';

class AddHotelFeesScreen extends StatelessWidget {
  const AddHotelFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: AddFees(
            title: 'Hébergement',
            icon: AppIcons.hotel,
            textInput: 'Saisir nuit(s)',
          ),
        ),
      );
}
