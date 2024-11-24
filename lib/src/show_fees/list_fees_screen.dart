import 'package:flutter/material.dart';
import 'package:gsb/src/imports.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class ListFeesScreen extends StatelessWidget {
  const ListFeesScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HeaderNavBar(showBackArrow: true, title: 'Liste des Frais'),
        body: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.gapMedium),
          child: Center(
            child: Column(
              children: [
                StreamBuilder<List<Map<String, dynamic>>>(
                  stream: FirestoreService.getUserFeesStream(),
                  builder: (context, snapshot) => (snapshot.connectionState ==
                          ConnectionState.waiting)
                      ? const CircularProgressIndicator()
                      : (snapshot.hasError)
                          ? Text(
                              'Erreur : ${snapshot.error}',
                              style: TextStyles.body,
                            )
                          : (!snapshot.hasData || snapshot.data!.isEmpty)
                              ? Text(
                                  'Aucun frais trouvé',
                                  style: TextStyles.body,
                                )
                              : Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: snapshot.data!
                                        .map((Map<String, dynamic> fee) {
                                      return Column(
                                        children: [
                                          ShowFeesButton(
                                            title: fee['title'] ?? 'N/A',
                                            date: fee['date'] ?? 'N/A',
                                            price: fee['price'] ?? 'N/A',
                                            repay: fee['repay'] ?? false,
                                            onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowFeesScreen(
                                                  documentId: fee['id'] ?? '',
                                                  title: fee['title'] ?? 'N/A',
                                                  image: fee['image'] ?? '',
                                                  date: fee['date'] ?? 'N/A',
                                                  number:
                                                      fee['number'] ?? 'N/A',
                                                  price: fee['price'] ?? 'N/A',
                                                  repay: fee['repay'] ?? false,
                                                ),
                                              ),
                                            ),
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
