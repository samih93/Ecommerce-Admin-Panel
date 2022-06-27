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
      if (element.status == "completed") element.list_of_status = ["view"];
      if (element.status != "delivered" && element.status != "completed")
        element.list_of_status = ["view", "delivered"];
      if (element.status == "delivered")
        element.list_of_status = ["view", "completed"];
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
