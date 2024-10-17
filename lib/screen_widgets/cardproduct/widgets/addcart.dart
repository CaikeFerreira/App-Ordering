import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../amount.dart';
import '../../../models/product.dart';
import '../../../screens/cart/cart_screen.dart';

class AddCart extends StatelessWidget {
  final TextEditingController amountController;
  final Product product;

  const AddCart({
    super.key,
    required this.product,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    if (amountController.text == "0") amountController.text = "1";

    return Row(
      children: [
        Amount(controller: amountController),
        SizedBox(
          width: 40,
          height: 30,
          child: IconButton(
            icon: const Icon(Icons.add_shopping_cart_rounded),
            padding: const EdgeInsets.all(0),
            iconSize: 30,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              num? amount = num.tryParse(amountController.text);

              if (amount != null) {
                if (amount == 0) amount = 1;

                product.amount = amount;
              }

              BlocProvider.of<CartCubit>(context).add(context, product);
            },
          ),
        )
      ],
    );
  }
}
