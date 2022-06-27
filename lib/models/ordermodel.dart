import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_panel/models/Address.dart';
import 'package:ecommerce_admin_panel/models/CartProduct.dart';
import 'package:ecommerce_admin_panel/models/UserModel.dart';

class Order {
  double? totalprice;
  String? uId;
  String? orderId;
  Timestamp? orderdate;
  String? status;
  Address? shippingAddress; // Address
  UserModel? personelInformation; // userModel
  List<CartProduct>? orderItems;
  List<String>? list_of_status;

  Order(
      {this.totalprice,
      this.uId,
      this.orderdate,
      this.status,
      this.shippingAddress,
      this.personelInformation,
      this.orderItems});

  Order.fromJson(Map<String, dynamic> map) {
    List<CartProduct> list_of_cart = [];

    totalprice = map["totalprice"] != null
        ? double.parse(map["totalprice"].toString())
        : 0;
    uId = map["uId"] != null ? map["uId"].toString() : '';
    orderId = map["orderId"] != null ? map["orderId"].toString() : '';
    orderdate = map["orderdate"] != null ? map["orderdate"] : Timestamp.now();
    status = map["status"] != null ? map["status"] : '';
    shippingAddress = Address.fromJson(map['shippingAddress']);
    personelInformation = UserModel.fromjson(map['personelInformation']);
    map["orderItems"].forEach((element) {
      list_of_cart.add(CartProduct.fromJson(element));
    });
    orderItems = list_of_cart;
  }

  toJson() {
    return {
      "totalprice": totalprice,
      "uId": uId,
      "orderId": orderId,
      "orderdate": orderdate,
      "status": status ?? '',
      "shippingAddress": shippingAddress?.toJson(),
      "personelInformation": personelInformation?.tojson(),
      "orderItems": [
        ...orderItems!.map(
          (e) => e.toJson(),
        ),
      ]
    };
  }
}
