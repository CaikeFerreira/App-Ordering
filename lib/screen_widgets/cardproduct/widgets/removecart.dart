import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../amount.dart';
import '../../../models/product.dart';
import '../../../screens/cart/cart_screen.dart';

class RemoveCart extends StatelessWidget {
  final Product product;
  final Function() updateAmount;
  final TextEditingController amountController;

  const RemoveCart({
    super.key,
    required this.product,
    required this.updateAmount,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 15,
          child: IconButton(
            iconSize: 15,
            icon: const Icon(Icons.close),
            padding: const EdgeInsets.all(0),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              BlocProvider.of<CartCubit>(context).delete(context, product);
            },
          ),
        ),
        Amount(
          controller: amountController,
          alterAmount: (count) {
            product.amount = count;

            if (count <= 0) {
              BlocProvider.of<CartCubit>(context).delete(context, product);
            } else {
              BlocProvider.of<CartCubit>(context).update(product);
            }

            updateAmount();
          },
        )
      ],
    );
  }
}
