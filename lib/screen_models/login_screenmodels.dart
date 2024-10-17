import '../models/login.dart';
import '../http/logins/login_http.dart';

class LoginScreenModels {
  Future<Login> findLogin(Login login) async {
    return await LoginHttp().find(login);
  }
}
