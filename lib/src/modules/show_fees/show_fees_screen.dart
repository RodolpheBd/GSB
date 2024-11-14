import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class ShowFeesScreen extends StatelessWidget {
  const ShowFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(showBackArrow: true, title: 'Liste des Frais'),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: AppDimensions.gapMedium),
              ShowFeesButton(
                title: 'Déplacement',
                date: '01/01/2021',
                price: '30€',
                repay: true,
                onPressed: () => (),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              ShowFeesButton(
                title: 'Café',
                date: '01/02/2022',
                price: '15€',
                repay: false,
                onPressed: () => (),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              ShowFeesButton(
                title: 'Hébergement',
                date: '01/05/2024',
                price: '75€',
                repay: true,
                onPressed: () => (),
              ),
            ],
          ),
        ),
      );
}
