import 'package:flutter/material.dart';
import 'package:gsb/src/imports.dart';

class LogoutService {
  Future<void> logout(BuildContext context) async => await FirebaseAuth.instance
      .signOut()
      .then((_) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false,
          ));
}
