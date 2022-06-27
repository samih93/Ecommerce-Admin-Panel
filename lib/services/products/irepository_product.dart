import 'package:ecommerce_admin_panel/models/prdouct.dart';

abstract class IrepositoryProduct
{
    Future<List<Product>> getProducts();

}