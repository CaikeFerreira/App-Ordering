import 'package:flutter/material.dart';

class RemoveCart extends StatelessWidget {
  final Function() onPressed;

  const RemoveCart({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: IconButton(
        iconSize: 18,
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
