import 'package:flutter/material.dart';

import '../../../constants/attributes.dart';

class ButtonLogin extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const ButtonLogin({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadiusBorder),
        ),
      ),
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(text),
      ),
    );
  }
}
