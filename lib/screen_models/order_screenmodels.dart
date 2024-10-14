import 'package:front_end/models/order.dart';
import 'package:front_end/models/orderitem.dart';
import 'package:front_end/http/orders/order_http.dart';

import '../models/product.dart';

class OrderScreenModels {

  Future<Order> add(Order order) async {
    return OrderHttp().add(order);
  }

  Future<List<Order>> findAll(int clientId) {
    return OrderHttp().findAll(clientId);
  }

  Order createOrder(num loginId, List<Product> products) {
    if (products.isEmpty) {
      throw Exception("No products in the cart!");
    }

    List<OrderItem> orderItems = [];

    for (var product in products) {
      OrderItem orderItem = OrderItem(
        amount: product.amount,
        value: product.price,
        product: product,
      );

      orderItems.add(orderItem);
    }

    Order order = Order(
      date: DateTime.now(),
      clientId: loginId,
      orderItems: orderItems,
    );

    return order;
  }

  double totalValue(Order order) {
    double value = 0;

    for (var item in order.orderItems) {
      value += item.value * item.amount;
    }

    return value;
  }
}
