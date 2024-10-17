import 'package:flutter/material.dart';

class ImageTask extends StatelessWidget {
  const ImageTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black12,
      ),
      width: 70,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: const Text(""),
      ),
    );
  }
}
