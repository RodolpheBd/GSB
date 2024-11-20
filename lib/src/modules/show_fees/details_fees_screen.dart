import 'package:flutter/material.dart';
import 'package:gsb/src/widgets/widgets.dart';

class DetailsFeesScreen extends StatelessWidget {
  final String documentId;
  final String title;
  final String? image;
  final String date;
  final String number;
  final String price;
  final bool repay;

  const DetailsFeesScreen({
    super.key,
    required this.documentId,
    required this.title,
    this.image,
    required this.date,
    required this.number,
    required this.price,
    required this.repay,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
            child: ShowFees(
                documentId: documentId,
                title: title,
                image: image,
                date: date,
                number: number,
                price: price,
                repay: repay)),
      );
}
