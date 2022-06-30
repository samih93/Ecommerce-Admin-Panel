import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/models/MyOrders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartData extends StatelessWidget {
  PieChartData();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCircularChart(series: <CircularSeries>[
      // Render pie chart
      PieSeries<OrderInfo, String>(
          dataSource: context.read<OrdersController>().chartData,
          pointColorMapper: (OrderInfo data, _) => data.color,
          xValueMapper: (OrderInfo data, _) => data.title,
          yValueMapper: (OrderInfo data, _) => data.percentage)
    ]));
  }
}
