import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsb/src/modules/modules.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class ShowFeesScreen extends StatelessWidget {
  const ShowFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(showBackArrow: true, title: 'Liste des Frais'),
        body: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.gapMedium),
          child: Center(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Fees')
                      .orderBy('date', descending: true)
                      .snapshots(),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? const CircularProgressIndicator()
                      : snapshot.hasError
                          ? Text(
                              'Erreur : ${snapshot.error}',
                              style: TextStyles.body,
                            )
                          : (!snapshot.hasData || snapshot.data!.docs.isEmpty)
                              ? Text(
                                  'Aucun frais trouvé',
                                  style: TextStyles.body,
                                )
                              : Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: snapshot.data!.docs
                                        .map((DocumentSnapshot document) {
                                      Map<String, dynamic> data = document
                                          .data() as Map<String, dynamic>;
                                      return Column(
                                        children: [
                                          ShowFeesButton(
                                            title: data['title'] ?? 'N/A',
                                            date: data['date'] ?? 'N/A',
                                            price: data['price'] ?? 'N/A',
                                            repay: data['repay'] ?? false,
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetailsFeesScreen(
                                                    documentId: document.id,
                                                    title:
                                                        data['title'] ?? 'N/A',
                                                    image: data['image'] ?? '',
                                                    date: data['date'] ?? 'N/A',
                                                    number:
                                                        data['number'] ?? 'N/A',
                                                    price:
                                                        data['price'] ?? 'N/A',
                                                    repay:
                                                        data['repay'] ?? false,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                              height: AppDimensions.gapSmall),
                                        ],
                                      );
                                    }).toList(),
                                  ),
                                ),
                ),
              ],
            ),
          ),
        ),
      );
}
