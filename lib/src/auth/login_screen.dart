import 'package:flutter/material.dart';
import 'package:gsb/src/imports.dart';
import 'package:gsb/src/widgets/widgets.dart';
import 'package:gsb/src/common/common.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginService _loginService = LoginService(FirebaseAuthService());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;

  void _login(BuildContext context) async {
    setState(() => _isLoading = true);
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    await _loginService.login(context, email, password);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    (_obscureText) ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                ),
              ),
              const SizedBox(height: AppDimensions.gapSmall),
              CustomButton(
                text: 'Login',
                isLoading: _isLoading,
                onPressed: () => !_isLoading ? _login(context) : null,
              )
            ],
          ),
        ),
      );
}
