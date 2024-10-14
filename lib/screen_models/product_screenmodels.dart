import '../http/products/product_http.dart';
import '../models/product.dart';

class ProductScreenModels {
  Future<List<Product>> findAll(int clientTypeId) {
    return ProductHttp().findAll(clientTypeId);
  }

  num totalValue(List<Product> products) {
    num total = 0;

    if (products.isEmpty) return total;

    for (var product in products) {
      total += product.amount * product.price;
    }

    return total;
  }
}
