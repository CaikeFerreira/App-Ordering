import 'package:flutter/material.dart';
import 'package:front_end/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/constants/attributes.dart';
import 'package:front_end/screen_widgets/card/cardcustom.dart';

import '../amount.dart';
import 'widgets/image.dart';
import 'widgets/addcart.dart';
import 'widgets/removecart.dart';
import '../../screens/cart/cart_screen.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  final Function() onTap;
  final bool addCart;
  final bool removeCart;
  final TextEditingController _amountController =
      TextEditingController(text: '0');

  CardProduct.addCart({
    super.key,
    required this.product,
    required this.onTap,
    this.addCart = true,
    this.removeCart = false,
  });

  CardProduct.removeCart({
    super.key,
    required this.product,
    required this.onTap,
    this.addCart = false,
    this.removeCart = true,
  });

  @override
  Widget build(BuildContext context) {
    _amountController.text = product.amount.toString();

    //NumberFormat formatNumero = NumberFormat.decimalPattern(locale);
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Stack(
        children: [
          CardCustom(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: ImageTask(),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.ean.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (addCart)
                            Amount(
                              controller: _amountController,
                            ),
                          if (removeCart)
                            RemoveCart(
                              onPressed: () {
                                BlocProvider.of<CartCubit>(context)
                                    .delete(context, product);
                              },
                            ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            formatMoeda.format(product.price),
                            style: const TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (addCart)
                            AddCart(
                              onPressed: () {
                                num? amount =
                                    num.tryParse(_amountController.text);

                                if (amount != null) {
                                  if (amount == 0) amount = 1;

                                  product.amount = amount;
                                }

                                BlocProvider.of<CartCubit>(context)
                                    .add(context, product);
                              },
                            ),
                          if (removeCart)
                            Amount(
                              controller: _amountController,
                              alterAmount: (count) {
                                product.amount = count;

                                // if (count <= 0) {
                                //   BlocProvider.of<CartCubit>(context)
                                //       .delete(context, product);
                                // } else {
                                BlocProvider.of<CartCubit>(context)
                                    .update(product);
                                // }
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
