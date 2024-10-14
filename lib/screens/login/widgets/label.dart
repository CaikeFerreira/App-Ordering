import 'package:flutter/material.dart';

class LabelLogin extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;

  const LabelLogin({super.key, required this.text, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: fontWeight,
          color: const Color(0XFF2661FA),
        ),
      ),
    );
  }
}
