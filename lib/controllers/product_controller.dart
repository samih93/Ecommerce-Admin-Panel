import 'package:ecommerce_admin_panel/models/prdouct.dart';
import 'package:ecommerce_admin_panel/shared/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';

class ProductController extends ChangeNotifier {
  //Get all student
  bool isloadingGetProduct = false;
  List<Product> list_of_product = [];
  List<Product> original_list_of_Product = [];

  Future<List<Product>> getallProduct() async {
    list_of_product = [];
    isloadingGetProduct = true;
    notifyListeners();
    await DioHelper.dio!.get("products").then((value) {
      value.data.forEach((element) {
        list_of_product.add((Product.fromJson(element)));
      });

      original_list_of_Product = list_of_product;
      isloadingGetProduct = false;

      list_of_product.forEach((element) {
        print(element.toJson());
      });
      notifyListeners();
    });
    return list_of_product;
  }

// search for a student
  bool isloadingSearchproduct = false;
  bool? ishasData = false;

  Future<void> searchproduct(String name) async {
    list_of_product = [];

    if (name.toString().trim() != "") {
      isloadingSearchproduct = true;
      notifyListeners();
      DioHelper.dio!.get("products/search",
          queryParameters: {"name": '$name'}).then((value) {
        value.data.forEach((element) {
          list_of_product.add((Product.fromJson(element)));
        });
        isloadingSearchproduct = false;
        notifyListeners();
      }).catchError((error) {
        print(error.toString());
      });
    } else {
      list_of_product = original_list_of_Product;
      notifyListeners();
    }
  }

  Future<void> updateProduct(Product product) async {
    //isloadingGetProduct = true;
    //  notifyListeners();
    DioHelper.dio!.put("products", data: {
      "id": product.id,
      "name": product.name,
      "price": product.price
    }).then((value) {
      list_of_product.map((p) => {
            if (p == product) {p.name = product.name, p.price = product.price}
          });

      original_list_of_Product = list_of_product;
      //isloadingGetProduct = false;

      list_of_product.forEach((element) {
        print(element.toJson());
      });
      notifyListeners();
    });
  }
}
