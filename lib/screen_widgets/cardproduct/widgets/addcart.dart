import 'package:flutter/material.dart';

class AddCart extends StatelessWidget {
  final Function() onPressed;

  const AddCart({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 95,
      child: IconButton(
        iconSize: 22,
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        icon: const Icon(Icons.add_shopping_cart_rounded),
      ),
    );
  }
}
