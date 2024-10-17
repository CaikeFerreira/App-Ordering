import 'package:flutter/material.dart';

import 'emptyorder.dart';
import '../../../models/order.dart';
import '../../../screen_widgets/cardorder/cardorder.dart';

class LoadOrders extends StatelessWidget {
  final List<Order> orders;

  const LoadOrders({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isNotEmpty) {
      orders.sort((a, b) => b.date.compareTo(a.date));
    }

    return Stack(
      children: [
        if (orders.isEmpty) const EmptyOrder(),
        if (orders.isNotEmpty)
          ListView(
            children: [
              for (Order order in orders) CardOrder(order: order),
            ],
          ),
      ],
    );
  }
}
