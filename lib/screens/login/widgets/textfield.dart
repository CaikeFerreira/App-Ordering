import 'package:flutter/material.dart';

class TextFormFielLogin extends StatelessWidget {
  final String labelTex;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final String? Function(String?)? validator;
  final bool obscureText;

  const TextFormFielLogin({
    super.key,
    required this.labelTex,
    this.controller,
    this.validator,
    this.autovalidateMode,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        autovalidateMode: autovalidateMode,
        decoration: InputDecoration(
          labelText: labelTex,
        ),
      ),
    );
  }
}
