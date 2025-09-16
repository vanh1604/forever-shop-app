import 'package:first_project/widgets/layout_welcome_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWelcomeScreen(child: const Text('Sign Up'));
  }
}
