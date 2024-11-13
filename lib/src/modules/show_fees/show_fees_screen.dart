import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/widgets.dart';

class ShowFeesScreen extends StatelessWidget {
  const ShowFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(showBackArrow: true, title: 'Liste des Frais'),
        body: Center(),
      );
}
