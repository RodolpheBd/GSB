import 'package:flutter/material.dart';
import 'package:gsb/src/modules/modules.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: AppDimensions.paddingTop),
          child: Column(
            children: [
              const Text(
                'Login',
                style: TextStyles.header,
              ),
              const SizedBox(height: AppDimensions.gapMedium),
              const CustomTextInput(placeholder: 'Saisir utilisateur'),
              const SizedBox(height: AppDimensions.gapSmall),
              const CustomTextInput(placeholder: 'Saisir mot de passe'),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomButton(
                text: 'Login',
                isBlackBackground: true,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}