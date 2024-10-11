import 'package:http/http.dart';

final Client client = Client();

const Map<String, String> headers = {'Content-type': 'application/json'};

class HttpException implements Exception {
  final String? message;

  HttpException(this.message);
}

String? getMessage(int statusCode) {
  if (_statusCodeResponses.containsKey(statusCode)) {
    return _statusCodeResponses[statusCode];
  }

  return 'Unknow error: $statusCode';
}

final Map<int, String> _statusCodeResponses = {
  400: 'Incorrect data sent',
  401: 'Authentication failure',
  500: 'Internal server error',
};
