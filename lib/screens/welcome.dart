import 'package:first_project/theme/constants/router_prefix.dart';
import 'package:first_project/widgets/layout_welcome_screen.dart';
import 'package:first_project/widgets/welcome_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWelcomeScreen(
      child: Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome to\n',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Dreamabtme Shop',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign In',
                      onTap: () => context.push('${RouterPrefix.signIn}'),
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign Up',
                      onTap: () => context.push('${RouterPrefix.signUp}'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
