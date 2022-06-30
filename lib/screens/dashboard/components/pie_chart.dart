import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/models/MyOrders.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  PieChart();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: secondaryColor,
        ),
        child: SfCircularChart(
            title: ChartTitle(text: 'Orders Status'),
            legend: Legend(isVisible: true),
            // tooltipBehavior:
            //     TooltipBehavior(enable: true, format: 'point.x : point.y%'),
            series: <CircularSeries>[
              // Render pie chart
              PieSeries<OrderInfo, String>(
                  radius: '55%',
                  dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelIntersectAction: LabelIntersectAction.shift,
                      overflowMode: OverflowMode.shift,
                      showZeroValue: true,
                      labelPosition: ChartDataLabelPosition.inside,
                      connectorLineSettings:
                          ConnectorLineSettings(type: ConnectorType.curve)),
                  dataSource: context.read<OrdersController>().chartData,
                  pointColorMapper: (OrderInfo data, _) => data.color,
                  dataLabelMapper: (OrderInfo data, _) =>
                      data.title.toString() +
                      "\n" +
                      data.percentage.toString() +
                      "%",
                  xValueMapper: (OrderInfo data, _) => data.title,
                  yValueMapper: (OrderInfo data, _) => data.percentage)
            ]));
  }
}
