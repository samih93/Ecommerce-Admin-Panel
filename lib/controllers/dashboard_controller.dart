import 'package:ecommerce_admin_panel/models/MyFiles.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/services/orders/repository_order.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardController extends ChangeNotifier {
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

  Future<void> getAllorders() async {
    isloadingGetAllProduct = true;
    notifyListeners();
    allOrders = await repositoryOrder.getorders();
    allOrders.forEach((element) {
      print(element.toJson());
    });

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
}
