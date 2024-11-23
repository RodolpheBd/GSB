import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Connexion d'un utilisateur avec email et mot de passe.
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      // Gestion spécifique des erreurs FirebaseAuth
      switch (e.code) {
        case 'user-not-found':
          throw Exception('Utilisateur introuvable.');
        case 'wrong-password':
          throw Exception('Mot de passe incorrect.');
        default:
          throw Exception('Erreur : ${e.message}');
      }
    } catch (e) {
      throw Exception('Une erreur est survenue.');
    }
  }

  /// Déconnexion d'un utilisateur.
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
