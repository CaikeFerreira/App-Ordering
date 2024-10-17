import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom.dart';
import 'emptycart.dart';
import '../../../models/product.dart';
import '../../home/Widgets/navigation_cart.dart';
import '../../../screen_widgets/cardproduct/cardproduct.dart';

class BodyScreen extends StatelessWidget {
  final List<Product> products;

  const BodyScreen({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    products.sort((a, b) => a.name.compareTo(b.name));

    BlocProvider.of<NavigationCartCubit>(context).updateAmount(products.length);
    return Stack(
      children: [
        if (products.isEmpty) const EmptyCart(),
        ListView(
          children: [
            for (Product product in products)
              CardProduct.removeCart(
                product: product,
                onTap: () {},
              ),
            Container(
              height: 100,
            )
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CartBottom(
            products: products,
          ),
        ),
      ],
    );
  }
}
