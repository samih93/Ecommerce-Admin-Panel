import 'package:ecommerce_admin_panel/models/MyOrders.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/models/top_selling_model.dart';
import 'package:ecommerce_admin_panel/services/orders/repository_order.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

class OrdersController extends ChangeNotifier {
  RepositoryOrder repositoryOrder = RepositoryOrder();

  List<Order> allOrders = [];
  bool isloadingGetAllProduct = false;

// NOTE packaging
  int get packagingOrderCount =>
      allOrders.where((element) => element.status == "packaging").length;

  int get packagingpercentage =>
      (packagingOrderCount / allOrders.length * 100).toInt();

// NOTE delivered

  int get deliveredOrderCount =>
      allOrders.where((element) => element.status == "delivered").length;

  int get deliveredpercentage =>
      (deliveredOrderCount / allOrders.length * 100).toInt();

// NOTE completed

  int get completedOrderCount =>
      allOrders.where((element) => element.status == "completed").length;

  int get completedpercentage =>
      (completedOrderCount / allOrders.length * 100).toInt();

  List<Order> original_all_orders = [];
  List<OrderInfo> demoMyOrder = [];
  List<OrderInfo> get chartData =>
      demoMyOrder.where((element) => element.title != "All Orders").toList();

  List<OrderInfo> topsellingChart = [
    OrderInfo(title: "nike 584", numOfOrders: 50, color: Colors.purple),
    OrderInfo(title: "adidas 584", numOfOrders: 30, color: Colors.deepOrange),
    OrderInfo(title: "puma asdasd ", numOfOrders: 10, color: Colors.amber),
    OrderInfo(
        title: "rebook running shoes",
        numOfOrders: 7,
        color: Colors.blue.shade900),
    OrderInfo(
        title: "adias x 19  football shoes",
        numOfOrders: 3,
        color: Colors.redAccent),
  ];
  List<TopSellingModel> get list_of_top_selling =>
      _list_of_topselling.take(5).toList();
  List<TopSellingModel> _list_of_topselling = [];

  Future<void> getAllorders() async {
    isloadingGetAllProduct = true;
    demoMyOrder = [];
    _list_of_topselling = [];
    notifyListeners();
    allOrders = await repositoryOrder.getorders();
    allOrders.forEach((element) {
      if (element.status == "completed") element.list_of_status = ["view"];
      if (element.status != "delivered" && element.status != "completed")
        element.list_of_status = ["view", "delivered"];
      if (element.status == "delivered")
        element.list_of_status = ["view", "completed"];

      // add all products with qty in _list_of_topselling
      element.orderItems!.forEach((val) {
        _list_of_topselling
            .add(TopSellingModel(val.name, val.productId, val.quantity));
      });
    });

    // save all orders in temp list
    original_all_orders = allOrders;

    // group by product id  ==> Map<String?, List<TopSellingModel>> newMap
    var newMap =
        groupBy(_list_of_topselling, (TopSellingModel obj) => obj.productId);

    _list_of_topselling.clear();

    //adding each item and how many sales
    newMap.forEach((key, value) {
      int count = 0;
      value.forEach((element) {
        count += element.nb!;
      });
      _list_of_topselling.add(TopSellingModel(value.first.name, key, count));
    });

// order by number desc
    _list_of_topselling.sort((a, b) => b.nb!.compareTo(a.nb!));

    _setcolors(list_of_top_selling);
    notifyListeners();

//   all orders cart
    demoMyOrder.add(OrderInfo(
      title: "All Orders",
      numOfOrders: allOrders.length,
      svgSrc: "assets/icons/Documents.svg",
      color: Colors.teal.shade300,
    ));

    //  pending orders cart
    demoMyOrder.add(OrderInfo(
      title: "Packaging",
      numOfOrders: packagingOrderCount,
      svgSrc: "assets/icons/Documents.svg",
      percentage: packagingpercentage,
      color: Colors.yellow.shade500,
    ));

    //  pending orders cart
    demoMyOrder.add(OrderInfo(
      title: "Delivered",
      numOfOrders: deliveredOrderCount,
      svgSrc: "assets/icons/Documents.svg",
      percentage: deliveredpercentage,
      color: Colors.lightBlueAccent.shade200,
    ));
    //  pending orders cart
    demoMyOrder.add(OrderInfo(
      title: "Completed",
      numOfOrders: completedOrderCount,
      svgSrc: "assets/icons/Documents.svg",
      percentage: completedpercentage,
      color: Colors.green.shade500,
    ));

    isloadingGetAllProduct = false;

    notifyListeners();
  }

  _setcolors(List<TopSellingModel> list) {
    list[0].color = Colors.red;
    list[1].color = Colors.blue;
    list[2].color = Colors.pink;
    list[3].color = Colors.yellow;
    list[4].color = Colors.green;
  }

// Search in orders

  // search_in_orders(String value) {

  // }

//NOTE on change status order
  String orderStatus = "view";
  bool isloadingupdate_orderStatus = false;

  Future<void> onchangeOrderStatus(String orderId, String statusvalue) async {
    orderStatus = statusvalue;
    isloadingupdate_orderStatus = true;
    notifyListeners();
    await repositoryOrder.updateOrderStatus(orderId, statusvalue).then((value) {
      allOrders.forEach((element) {
        if (element.orderId == orderId) {
          element.status = orderStatus;
          if (statusvalue == "completed") element.list_of_status = ["view"];
          if (statusvalue != "delivered" && statusvalue != "completed")
            element.list_of_status = ["view", "delivered"];
          if (statusvalue == "delivered")
            element.list_of_status = ["view", "completed"];
        }
      });
      isloadingupdate_orderStatus = false;
      getAllorders();
      notifyListeners();
    });
  }

  // NOTE onchage table view
  OrderStatus table_orderStatus = OrderStatus.all;

  void onchangeTableOrderStatus(OrderStatus o) {
    allOrders = original_all_orders;

    table_orderStatus = o;
    switch (o) {
      case OrderStatus.all:
        allOrders = original_all_orders;

        break;
      case OrderStatus.packaging:
        allOrders = allOrders
            .where((element) => element.status == "packaging")
            .toList();
        break;
      case OrderStatus.completed:
        allOrders = allOrders
            .where((element) => element.status == "completed")
            .toList();
        break;

      case OrderStatus.delivered:
        allOrders = allOrders
            .where((element) => element.status == "delivered")
            .toList();
        break;
    }
    notifyListeners();
  }
}

enum OrderStatus { all, packaging, completed, delivered }
