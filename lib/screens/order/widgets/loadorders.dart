import 'package:flutter/material.dart';
import 'package:front_end/models/order.dart';
import 'package:front_end/screen_widgets/cardorder/cardorder.dart';

import 'emptyorder.dart';

class LoadOrders extends StatelessWidget {
  final List<Order> orders;

  const LoadOrders({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (orders.isEmpty) EmptyOrder(),
        ListView(
          children: [
            for (Order order in orders) CardOrder(order: order),
          ],
        ),
      ],
    );
  }
}
