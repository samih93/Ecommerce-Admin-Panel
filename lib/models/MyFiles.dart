import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/material.dart';

class OrderInfo {
  final String? svgSrc, title;
  final int? numOfFiles;
  final Color? color;

  OrderInfo({
    this.svgSrc,
    this.title,
    // this.totalStorage,
    this.numOfFiles,
    //this.percentage,
    this.color,
  });
}
