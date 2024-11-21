import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsb/src/utils/alerts/alert_service.dart';

class FirestoreService {
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
      if (actionType != 'delete' && (date.isEmpty || number.isEmpty || price.isEmpty)) {
        AlertDialogWidget.showErrorDialog(context);
        return;
      }

      switch (actionType) {
        case 'add':
          await FirebaseFirestore.instance.collection('Fees').add({
            'title': title,
            'date': date,
            'number': number,
            'price': price,
            'image': imagePath ?? 'Pas de justificatif',
            'repay': false,
          });
          break;
        case 'update':
          documentId.isEmpty
              ? AlertDialogWidget.showErrorDialog(context)
              : await FirebaseFirestore.instance
                  .collection('Fees')
                  .doc(documentId)
                  .update({
                  'date': date,
                  'number': number,
                  'price': price,
                });
          break;
        case 'delete':
          documentId.isEmpty
              ? AlertDialogWidget.showErrorDialog(context)
              : await FirebaseFirestore.instance
                  .collection('Fees')
                  .doc(documentId)
                  .delete();
          break;
        default:
          AlertDialogWidget.showErrorDialog(context);
          return;
      }

      Future.delayed(
          const Duration(seconds: 2), () => Navigator.of(context).pop());
      AlertDialogWidget.showSuccessDialog(context);
    } catch (e) {
      AlertDialogWidget.showErrorDialog(context);
    }
  }
}
