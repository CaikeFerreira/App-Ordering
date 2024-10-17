import 'package:flutter/material.dart';

import '../../../screen_widgets/centered_message.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const CenteredMessage(
      "Carrinho Vazio!",
      icon: Icons.remove_shopping_cart_outlined,
    );
  }
}
