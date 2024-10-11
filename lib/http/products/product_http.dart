import 'dart:convert';

import 'package:http/http.dart';

import '../../constants/uris.dart';
import '../../models/product.dart';
import '../httpclient.dart';

class ProductHttp {
  Future<List<Product>> findAll(int clientTypeId) async {
    final Response response = await client.get(
      productUri(id: clientTypeId),
      headers: headers,
    );

    final List<dynamic> decodedJson = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return decodedJson.map((dynamic json) => Product.formJson(json)).toList();
    }

    throw HttpException(getMessage(response.statusCode));
  }
}
