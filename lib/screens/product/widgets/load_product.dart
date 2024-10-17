import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cart_screen.dart';
import '../../../models/product.dart';
import '../../../screen_widgets/cardproduct/cardproduct.dart';

Widget loadProduct(BuildContext context, List<Product> products) {
  products.sort((a, b) => a.name.compareTo(b.name));
  return ListView(
    children: [
      const SizedBox(height: 70),
      for (Product product in products)
        CardProduct.addCart(
          product: product,
          onTap: () {
            BlocProvider.of<CartCubit>(context).add(context, product);
          },
        ),
    ],
  );
}
