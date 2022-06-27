import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_panel/models/prdouct.dart';
import 'package:ecommerce_admin_panel/services/products/irepository_product.dart';

class RepositoryProduct extends IrepositoryProduct {
  final databasereference = FirebaseFirestore.instance;

  @override
  Future<List<Product>> getProducts() async {
    List<Product> _products = [];
    await databasereference.collection('Products').get().then((value) {
      print("product lenght " + value.docs.length.toString());
      if (value.docs.length > 0) {
        value.docs.forEach((element) {
          _products.add(Product.fromJson(element.data()));
        });
      }
    });

    return _products;
  }
}
