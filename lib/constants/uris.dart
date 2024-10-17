const String _baseUri = "localhost:32768";
const String _loginUri = "login";
const String _productUri = "product/client";
const String _ordertUri = "order";
const String _ordertClientUri = "order/client";

Uri loginUri({int id = -1}) {
  return _compileUri(uri: _loginUri, id: id);
}

Uri productUri({int id = -1}) {
  return _compileUri(uri: _productUri, id: id);
}

Uri orderUri({int id = -1}) {
  return _compileUri(uri: _ordertUri, id: id);
}

Uri orderClientUri({int id = -1}) {
  return _compileUri(uri: _ordertClientUri, id: id);
}

Uri _compileUri({required String uri, int id = -1}) {
  if (id > -1) {
    return Uri.https(_baseUri, "$uri/$id");
  }

  return Uri.https(_baseUri, uri);
}
