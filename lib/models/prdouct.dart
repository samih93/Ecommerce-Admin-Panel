class Product {
  String? id;
  String? name;
  double? price;

  Product({this.id, this.name, this.price = 0});

  Product.fromJson(Map<String, dynamic> map) {
    id = map['id'].toString();
    name = map['name'];
    price = map['price'] != null ? double.parse(map['price'].toString()) : 0;
  }

  toJson() {
    return {'id': id, 'name': name, 'price': price};
  }
}
