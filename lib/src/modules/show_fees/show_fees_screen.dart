import 'package:flutter/material.dart';

class ShowFeesScreen extends StatelessWidget {
  final List<Fee> fees;

  const ShowFeesScreen({super.key, required this.fees});

  @override
  Widget build(BuildContext context) {
    // Trier les frais du plus récent au plus ancien
    fees.sort((a, b) => b.date.compareTo(a.date));

    return Scaffold(
      appBar: AppBar(
        title: Text('Frais Enregistrés'),
      ),
      body: ListView.builder(
        itemCount: fees.length,
        itemBuilder: (context, index) {
          final fee = fees[index];
          return ListTile(
            title: Text(fee.description),
            subtitle: Text('${fee.amount} € - ${fee.date.toLocal()}'),
          );
        },
      ),
    );
  }
}

class Fee {
  final String description;
  final double amount;
  final DateTime date;

  Fee({required this.description, required this.amount, required this.date});
}
