import 'dart:convert';

import 'package:front_end/constants/uris.dart';
import 'package:http/http.dart';

import '../../models/order.dart';
import '../httpclient.dart';

class OrderHttp {
  Future<Order> add(Order order) async {
    final Response response = await client.post(
      orderUri(),
      headers: headers,
      body: jsonEncode(order.toJson()),
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Order.formJson(jsonDecode(response.body));
    }

    throw HttpException(getMessage(response.statusCode));
  }

  Future<List<Order>> findAll(int clientId) async {
    final Response response = await client.get(
      orderClientUri(id: clientId),
      headers: headers,
    );

    final List<dynamic> decoderJson = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return decoderJson.map((dynamic json) => Order.formJson(json)).toList();
    }

    throw HttpException(getMessage(response.statusCode));
  }
}
