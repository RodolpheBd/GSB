import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('Utilisateur introuvable.');
        case 'wrong-password':
          throw Exception('Mot de passe incorrect.');
        default:
          throw Exception('Erreur : ${e.message}');
      }
    }
  }
}
