import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final Size size;
  final String text;
  final Function()? onTap;

  ButtonLogin({required this.size, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 136, 34),
                Color.fromARGB(255, 255, 177, 41),
              ],
            ),
          ),
          padding: const EdgeInsets.all(0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
