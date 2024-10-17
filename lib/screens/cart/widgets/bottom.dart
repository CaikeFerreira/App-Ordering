import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart_screen.dart';
import '../../../models/product.dart';
import '../../../constants/attributes.dart';
import '../../../screen_models/product_screenmodels.dart';

class CartBottom extends StatelessWidget {
  final NumberFormat formatMoeda = NumberFormat.simpleCurrency(locale: locale);

  final List<Product> products;

  CartBottom({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(defaultPadding * 2),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total:",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                formatMoeda.format(ProductScreenModels().totalValue(products)),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(defaultRadiusBorder),
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context).uploadOrder();
                  },
                  child: const Text("Efetuar Pedido"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
