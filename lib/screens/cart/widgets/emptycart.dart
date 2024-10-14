import 'package:flutter/material.dart';
import 'package:front_end/screen_widgets/centered_message.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CenteredMessage(
      "Carrinho Vazio!",
      icon: Icons.remove_shopping_cart_outlined,
    );
  }
}
