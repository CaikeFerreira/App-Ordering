class Product {
  num id;
  num ean;
  String name;
  num amount = 0;
  num price = 999;
  DateTime validity;

  Product({
    required this.id,
    required this.ean,
    required this.name,
    this.amount = 0,
    this.price = 999,
    required this.validity,
  });

  Product.formJson(Map<String, dynamic> json)
      : id = json['id'],
        ean = json['ean'],
        name = json['name'],
        //amount = json['amaount'],
        price = json['price'] ?? 999,
        validity = json['price'] != null
            ? DateTime.parse(json['validity'])
            : DateTime.parse("0001-01-01");

  Map<String, dynamic> toJson() => {
        'id': id,
        'ean': ean,
        'name': name,
        'amaount': amount,
        'price': price,
      };
}
