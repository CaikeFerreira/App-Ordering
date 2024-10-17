import 'dart:convert';

import 'package:http/http.dart';

import '../httpclient.dart';
import '../../models/login.dart';
import '../../constants/uris.dart';

class LoginHttp {
  Future<Login> find(Login login) async {
    final Response response = await client.post(
      loginUri(),
      headers: headers,
      body: jsonEncode(login.toJson()),
    );

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return Login.formJson(jsonDecode(response.body));
    }

    if (response.statusCode == 404) {
      return login;
    }

    throw HttpException(getMessage(response.statusCode));
  }
}
