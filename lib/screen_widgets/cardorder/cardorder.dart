import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:front_end/screen_widgets/card/cardcustom.dart';

import '../../models/order.dart';
import '../../constants/attributes.dart';
import '../../screen_models/order_screenmodels.dart';

class CardOrder extends StatelessWidget {
  final Order order;

  const CardOrder({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: CardCustom(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#${order.id}",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
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
        ),
      ),
    );
  }
}
