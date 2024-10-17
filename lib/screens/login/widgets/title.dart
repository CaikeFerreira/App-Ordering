import 'package:flutter/material.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: const Text(
        "LOGIN",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF2661FA),
          fontSize: 36,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
