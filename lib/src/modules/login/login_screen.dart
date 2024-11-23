import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsb/src/modules/modules.dart';
import 'package:gsb/src/services/services.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  void _login(BuildContext context) async {
    // Validation des champs
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      AlertDialogWidget.showErrorDialog(
        context,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Tentative de connexion via FirebaseAuth
    try {
      User? user = await FirebaseAuthService().signIn(email, password);
      if (user != null) {
        // Affichage du succès avec redirection après un délai
        AlertDialogWidget.showSuccessDialog(
          context,
        );

        Future.delayed(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          ),
        );
      }
    } catch (e) {
      AlertDialogWidget.showErrorDialog(
        context,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderNavBar(title: 'Login'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: AppDimensions.gapMedium),
            CustomTextInput(
                controller: _emailController,
                placeholder: 'Saisir utilisateur'),
            const SizedBox(height: AppDimensions.gapSmall),
            CustomTextInput(
              controller: _passwordController,
              placeholder: 'Saisir mot de passe',
              showObscureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            const SizedBox(height: AppDimensions.gapSmall),
            _isLoading
                ? CircularProgressIndicator()
                : CustomButton(
                    text: 'Login',
                    onPressed: () => _login(context),
                  ),
          ],
        ),
      ),
    );
  }
}
