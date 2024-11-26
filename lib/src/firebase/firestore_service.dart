import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/widgets.dart';

class FirestoreService {
  static User? _getCurrentUser() => FirebaseAuth.instance.currentUser;

  static CollectionReference<Map<String, dynamic>>? _getUserFeesRef(
          User? user) =>
      (user == null || user.email == null)
          ? null
          : FirebaseFirestore.instance
              .collection('users')
              .doc(user.email!.toLowerCase())
              .collection('Fees');

  static Future<void> handleAction({
    required BuildContext context,
    required String actionType,
    required String documentId,
    required String date,
    required String number,
    required String price,
    required String title,
    String? imagePath,
  }) async {
    try {
      final currentUser = _getCurrentUser();
      final userFeesRef = _getUserFeesRef(currentUser);

      if (userFeesRef == null) {
        AlertDialogWidget.showErrorDialog(context);
        return;
      }

      if (actionType != 'delete' &&
          [date, number, price, title].any((field) => field.isEmpty)) {
        AlertDialogWidget.showErrorDialog(context);
        return;
      }

      await (actionType == 'add'
          ? userFeesRef.add({
              'title': title,
              'date': date,
              'number': number,
              'price': price,
              'image': imagePath ?? 'Pas de justificatif',
              'repay': false,
              'createdAt': FieldValue.serverTimestamp(),
            })
          : actionType == 'update'
              ? (documentId.isEmpty
                  ? throw Exception('ID du document manquant.')
                  : userFeesRef.doc(documentId).update({
                      'date': date,
                      'number': number,
                      'price': price,
                    }))
              : actionType == 'delete'
                  ? (documentId.isEmpty
                      ? throw Exception('ID du document manquant.')
                      : userFeesRef.doc(documentId).delete())
                  : throw Exception('Type d’action invalide.'));

      AlertDialogWidget.showSuccessDialog(context);
      Future.delayed(
        const Duration(seconds: AppDuration.alertDialogTime),
        () => Navigator.of(context).pop(),
      );
    } catch (e) {
      AlertDialogWidget.showErrorDialog(context);
    }
  }

  // Fetch all the fees for the currently logged-in user
  static Future<List<Map<String, dynamic>>> getUserFees() async {
    final userFeesRef = _getUserFeesRef(_getCurrentUser());

    if (userFeesRef == null) {
      throw Exception('Utilisateur non connecté.');
    }

    try {
      final snapshot =
          await userFeesRef.orderBy('createdAt', descending: true).get();
      return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
    } catch (e) {
      throw Exception(
          'Erreur lors de la récupération des frais : ${e.toString()}');
    }
  }

  // Fetch real-time fees for the currently logged-in user
  static Stream<List<Map<String, dynamic>>> getUserFeesStream() {
    final userFeesRef = _getUserFeesRef(_getCurrentUser());
    return userFeesRef == null
        ? Stream.value([])
        : userFeesRef.orderBy('createdAt', descending: true).snapshots().map(
              (snapshot) => snapshot.docs
                  .map((doc) => {'id': doc.id, ...doc.data()})
                  .toList(),
            );
  }
}
