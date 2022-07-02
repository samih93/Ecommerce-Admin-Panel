import 'package:flutter/material.dart';

class TopSellingModel {
  String? name;
  String? productId;
  int? nb;
  Color? color;

  TopSellingModel(this.name, this.productId, this.nb);

  TopSellingModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    productId = map['productId'];
    nb = map['nb'];
  }

  toJson() {
    return {'name': name, 'productId': productId, 'nb': nb};
  }
}
