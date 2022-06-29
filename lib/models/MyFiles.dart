import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/material.dart';

class OrderInfo {
  final String? svgSrc, title;
  final int? numOfOrders;
  final Color? color;
  final int? percentage;
  int? orderId;

  OrderInfo({
    this.svgSrc,
    this.title,
    // this.totalStorage,
    this.numOfOrders,
    this.percentage,
    this.color,
  });
}
