class Login {
  num id;
  num clientTypeId;
  String name;
  String user;
  String password;

  Login({
    required this.id,
    required this.clientTypeId,
    required this.name,
    required this.user,
    required this.password,
  });

  Login.formJson(Map<String, dynamic> json)
      : id = json['id'],
        clientTypeId = json['clientTypeId'],
        name = json["name"].toString(),
        user = json['user'].toString(),
        password = json['password'].toString();

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'name': name,
        'user': user,
        'password': password,
      };
}
