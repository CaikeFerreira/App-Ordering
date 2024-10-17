import 'product.dart';

class OrderItem {
  num amount;
  num value;
  Product? product;

  OrderItem({
    required this.amount,
    required this.value,
    required this.product,
  });

  OrderItem.formJson(Map<String, dynamic> json)
      : amount = json['amount'],
        value = json['value'],
        product =
            json['product'] != null ? Product.formJson(json['product']) : null;

  static List<OrderItem> formJsonList(Map<String, dynamic> json) {
    List<dynamic>? lists = (json['items'] as List<dynamic>?);

    if (lists == null) return [];

    return lists.map((itemJson) => OrderItem.formJson(itemJson)).toList();
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'value': value,
        'productId': product!.id,
      };
}
