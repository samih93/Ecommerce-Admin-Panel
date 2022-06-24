import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/services/orders/irepository_order.dart';

class RepositoryOrder implements IrepositoryOrder {
  final databasereference = FirebaseFirestore.instance;

  @override
  Future<List<Order>> getorders() async {
    // TODO: implement getorders
    List<Order> _orders = [];
    await databasereference.collection('orders').get().then((value) {
      print("order lenght " + value.docs.length.toString());
      if (value.docs.length > 0) {
        value.docs.forEach((element) {
          _orders.add(Order.fromJson(element.data()));
        });
      }
    });

    return _orders;
  }
}
