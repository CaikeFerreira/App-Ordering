import 'package:flutter/material.dart';

import 'widgets/image.dart';
import 'widgets/addcart.dart';
import 'widgets/removecart.dart';
import '../card/cardcustom.dart';
import '../../models/product.dart';
import '../../constants/attributes.dart';

class CardProduct extends StatefulWidget {
  final Product product;
  final Function() onTap;
  final bool addCart;
  final bool removeCart;

  const CardProduct.addCart({
    super.key,
    required this.product,
    required this.onTap,
    this.addCart = true,
    this.removeCart = false,
  });

  const CardProduct.removeCart({
    super.key,
    required this.product,
    required this.onTap,
    this.addCart = false,
    this.removeCart = true,
  });

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  final TextEditingController _amountController =
      TextEditingController(text: '1');
  num _productPriceTotal = 0;

  void _updateAmount() {
    int quantity = int.parse(_amountController.text);

    if (widget.removeCart) _productPriceTotal = widget.product.price * quantity;
  }

  @override
  Widget build(BuildContext context) {
    _amountController.text = widget.product.amount.toString();
    _productPriceTotal = widget.product.price;
    _updateAmount();

    return CardCustom(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ImageTask(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          widget.product.ean.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatMoeda.format(_productPriceTotal),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        if (widget.addCart)
                          AddCart(
                            product: widget.product,
                            amountController: _amountController,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (widget.removeCart)
              RemoveCart(
                product: widget.product,
                amountController: _amountController,
                updateAmount: () {
                  setState(
                    () {
                      _updateAmount();
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
