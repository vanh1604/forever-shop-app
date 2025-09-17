import 'package:flutter/material.dart';

class LayoutWelcomeScreen extends StatelessWidget {
  const LayoutWelcomeScreen({super.key, required this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg-welcome.avif',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.white.withOpacity(0.3),
            height: double.infinity,
            width: double.infinity,
          ),
          child!,
        ],
      ),
    );
  }
}
