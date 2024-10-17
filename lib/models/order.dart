import 'orderitem.dart';

class Order {
  num id;
  num clientId;
  DateTime date;
  List<OrderItem> orderItems;

  Order({
    this.id = 0,
    required this.date,
    required this.clientId,
    required this.orderItems,
  });

  Order.formJson(Map<String, dynamic> json)
      : id = json['id'],
        clientId = json['clientId'],
        date = DateTime.parse(json['date']),
        orderItems = OrderItem.formJsonList(json);

  Map<String, dynamic> toJson() => {
        'id': id,
        'clientId': clientId,
        'date': date.toIso8601String(),
        'items': orderItems.map((orderItem) => orderItem.toJson()).toList(),
      };
}
