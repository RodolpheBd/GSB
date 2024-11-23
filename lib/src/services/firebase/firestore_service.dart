import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsb/src/services/alerts/alert_service.dart';

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
      // Obtenir l'utilisateur actuellement connecté
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null || currentUser.email == null) {
        AlertDialogWidget.showErrorDialog(context);
        return;
      }

      // Obtenir le mail de l'utilisateur connecté
      final userEmail = currentUser.email!.toLowerCase();

      // Vérification des champs requis (sauf pour une suppression)
      if (actionType != 'delete' &&
          (date.isEmpty || number.isEmpty || price.isEmpty || title.isEmpty)) {
        AlertDialogWidget.showErrorDialog(context);
        return;
      }

      // Référence à la sous-collection "Fees" de l'utilisateur basé sur son email
      final userFeesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .collection('Fees');

      switch (actionType) {
        case 'add':
          // Ajouter un frais
          await userFeesRef.add({
            'title': title,
            'date': date,
            'number': number,
            'price': price,
            'image': imagePath ?? 'Pas de justificatif',
            'repay': false,
            'createdAt': FieldValue.serverTimestamp(),
          });
          break;

        case 'update':
          // Mettre à jour un frais existant
          if (documentId.isEmpty) {
            AlertDialogWidget.showErrorDialog(context);
            return;
          }
          await userFeesRef.doc(documentId).update({
            'date': date,
            'number': number,
            'price': price,
          });
          break;

        case 'delete':
          // Supprimer un frais
          if (documentId.isEmpty) {
            AlertDialogWidget.showErrorDialog(context);
            return;
          }
          await userFeesRef.doc(documentId).delete();
          break;

        default:
          AlertDialogWidget.showErrorDialog(context);
          return;
      }

      // Afficher un message de succès
      Future.delayed(
          const Duration(seconds: 2), () => Navigator.of(context).pop());
      AlertDialogWidget.showSuccessDialog(context);
    } catch (e) {
      // Gestion des erreurs
      AlertDialogWidget.showErrorDialog(
        context,
      );
    }
  }

  /// Méthode pour récupérer tous les frais d'un utilisateur connecté via son email
  static Future<List<Map<String, dynamic>>> getUserFees() async {
    try {
      // Obtenir l'utilisateur actuellement connecté
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null || currentUser.email == null) {
        throw Exception('Utilisateur non connecté ou email manquant.');
      }

      // Obtenir le mail de l'utilisateur connecté
      final userEmail = currentUser.email!.toLowerCase();

      // Récupérer les documents de la sous-collection "Fees"
      final userFeesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .collection('Fees');

      QuerySnapshot snapshot =
          await userFeesRef.orderBy('createdAt', descending: true).get();

      // Retourner les données sous forme de liste de maps
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          ...doc.data() as Map<String, dynamic>,
        };
      }).toList();
    } catch (e) {
      throw Exception(
          'Erreur lors de la récupération des frais : ${e.toString()}');
    }
  }

  /// Méthode pour récupérer les frais d'un utilisateur en temps réel via son email
  static Stream<List<Map<String, dynamic>>> getUserFeesStream() {
    try {
      // Obtenir l'utilisateur actuellement connecté
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null || currentUser.email == null) {
        return Stream.value([]); // Retourner un flux vide si non connecté
      }

      // Obtenir le mail de l'utilisateur connecté
      final userEmail = currentUser.email!.toLowerCase();

      // Récupérer les documents de la sous-collection "Fees" en temps réel
      final userFeesRef = FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .collection('Fees');

      return userFeesRef.orderBy('createdAt', descending: true).snapshots().map(
        (snapshot) {
          return snapshot.docs.map((doc) {
            return {
              'id': doc.id,
              ...doc.data() as Map<String, dynamic>,
            };
          }).toList();
        },
      );
    } catch (e) {
      // En cas d'erreur, retourner un flux vide
      return Stream.value([]);
    }
  }
}
