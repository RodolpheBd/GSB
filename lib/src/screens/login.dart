import 'package:flutter/material.dart';
import 'package:application_gsb/src/widgets/TextInput.dart';
import 'package:application_gsb/src/widgets/Button.dart';
import 'package:application_gsb/src/styles/TextStyles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Column(
            children: [
              const Text(
                'Login',
                style: TextStyles.header,
              ),
              const TextInput(placeholder: 'Saisir utilisateur'),
              const TextInput(placeholder: 'Saisir mot de passe'),
              Button(
                text: 'Login',
                isBlackBackground: true,
                onPressed: () {
                  print('Login Button Pressed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
