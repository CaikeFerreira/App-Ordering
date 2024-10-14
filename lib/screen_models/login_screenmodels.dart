import 'package:front_end/http/logins/login_http.dart';

import '../models/login.dart';

class LoginScreenModels {
  Future<Login> findLogin(Login login) async {
    return await LoginHttp().find(login);
  }
}
