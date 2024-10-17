import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../card/cardcustom.dart';
import '../../models/order.dart';
import '../../constants/attributes.dart';
import '../../screen_models/order_screenmodels.dart';


class CardOrder extends StatelessWidget {
  final Order order;

  const CardOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return CardCustom(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#${order.id}",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat(dataFormat).format(order.date),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                "Total: ${formatMoeda.format(OrderScreenModels().totalValue(order))}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
