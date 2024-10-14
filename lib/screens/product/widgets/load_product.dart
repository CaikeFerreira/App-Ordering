import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/screens/cart/cart_screen.dart';

import '../../../models/product.dart';
import '../../../screen_widgets/cardproduct/cardproduct.dart';

Widget LoadProduct(BuildContext context, List<Product> products) {
  products.sort((a, b) => a.name.compareTo(b.name));
  return ListView(
    children: [
      SizedBox(height: 50),
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
