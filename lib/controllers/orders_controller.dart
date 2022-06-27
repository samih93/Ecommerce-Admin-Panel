import 'package:ecommerce_admin_panel/models/MyFiles.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/services/orders/repository_order.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersController extends ChangeNotifier {
  RepositoryOrder repositoryOrder = RepositoryOrder();

  List<Order> allOrders = [];
  bool isloadingGetAllProduct = false;

  int get pendingOrderCount =>
      allOrders.where((element) => element.status == "Pending").length;

  int get completedOrderCount =>
      allOrders.where((element) => element.status == "Completed").length;

  List demoMyOrder = [];
  int get pendingpercentage =>
      (pendingOrderCount / allOrders.length * 100).toInt();
  int get completedpercentage =>
      (completedOrderCount / allOrders.length * 100).toInt();

  List<Order> original_all_orders = [];

  Future<void> getAllorders() async {
    isloadingGetAllProduct = true;
    notifyListeners();
    allOrders = await repositoryOrder.getorders();
    allOrders.forEach((element) {
      print(element.toJson());
    });
    original_all_orders = allOrders;

//   all orders cart
    demoMyOrder.add(OrderInfo(
      title: "All Orders",
      numOfFiles: allOrders.length,
      svgSrc: "assets/icons/Documents.svg",
      color: primaryColor,
    ));

    //  pending orders cart
    demoMyOrder.add(OrderInfo(
      title: "Pending",
      numOfFiles: pendingOrderCount,
      svgSrc: "assets/icons/Documents.svg",
      percentage: pendingpercentage,
      color: Colors.red.shade500,
    ));

    //  pending orders cart
    demoMyOrder.add(OrderInfo(
      title: "Completed",
      numOfFiles: completedOrderCount,
      svgSrc: "assets/icons/Documents.svg",
      percentage: completedpercentage,
      color: Colors.green.shade500,
    ));

    isloadingGetAllProduct = false;

    notifyListeners();
  }

// Search in orders

  // search_in_orders(String value) {

  // }

  // NOTE onchage status order
  OrderStatus orderStatus = OrderStatus.All;

  void onchangeOrderStatus(OrderStatus o) {
    allOrders = original_all_orders;

    orderStatus = o;
    switch (o) {
      case OrderStatus.All:
        allOrders = original_all_orders;

        break;
      case OrderStatus.Completed:
        allOrders = allOrders
            .where((element) => element.status == "Completed")
            .toList();
        break;
      case OrderStatus.Pending:
        allOrders =
            allOrders.where((element) => element.status == "Pending").toList();
        break;
    }
    notifyListeners();
  }
}

enum OrderStatus { All, Completed, Pending }