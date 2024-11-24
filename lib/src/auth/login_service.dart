import 'package:flutter/material.dart';
import 'package:gsb/src/imports.dart';
import 'package:gsb/src/common/common.dart';
import 'package:gsb/src/widgets/alert_dialog.dart';

class LoginService {
  final FirebaseAuthService _firebaseAuthService;

  LoginService(this._firebaseAuthService);

  Future<void> login(
      BuildContext context, String email, String password) async {
    (email.isEmpty || password.isEmpty)
        ? AlertDialogWidget.showErrorDialog(context)
        : null;

    try {
      await _firebaseAuthService.signIn(email, password);

      AlertDialogWidget.showSuccessDialog(context);
      Future.delayed(
        Duration(seconds: AppDuration.splashScreenTime.toInt()),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        ),
      );
    } catch (e) {
      AlertDialogWidget.showErrorDialog(context);
    }
  }
}
