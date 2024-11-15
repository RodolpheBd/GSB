import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/widgets.dart';

class DetailsFeesScreen extends StatelessWidget {
  const DetailsFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: ShowFees(
                title: "Déplacement",
                // image: Image.asset('Users/Rodolphe/Pictures/jpeg.jpg'),
                date: "15-20-2025",
                number: "22km",
                price: "33€ H.T.",
                repay: true)),
      );
}
