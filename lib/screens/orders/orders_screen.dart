import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/controllers/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/screens/main/main_screen.dart';
import 'package:ecommerce_admin_panel/screens/orders/view_order_screen.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<OrderStatus>(
                  value: context.watch<OrdersController>().table_orderStatus,
                  items: OrderStatus.values.map((OrderStatus orderstatus) {
                    return DropdownMenuItem<OrderStatus>(
                      value: orderstatus,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Text(orderstatus.name),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value);
                    context.read<OrdersController>()
                      ..onchangeTableOrderStatus(value!);
                  },
                ),
              ],
            ),
            Container(
              height: 400,
              child: Consumer<OrdersController>(
                  builder: (context, ordercontorller, child) {
                return DataTable2(
                  columnSpacing: defaultPadding,
                  //minWidth: 600,
                  columns: [
                    DataColumn(
                      label: Text("Order Id"),
                    ),
                    DataColumn(
                      label: Text("Order Date"),
                    ),
                    DataColumn(
                      label: Text("Status"),
                    ),
                    DataColumn(
                      label: Text("Total Price"),
                    ),
                    // DataColumn(
                    //   label: Text("User Id"),
                    // ),
                    DataColumn(
                      label: Text(""),
                    ),
                  ],
                  rows: List.generate(
                    ordercontorller.allOrders.length,
                    (index) => recentOrderDataRow(
                        ordercontorller.allOrders[index], context),
                  ),
                );
              }),
            ),
          ],
        ),
        if (context.watch<OrdersController>().isloadingupdate_orderStatus)
          CircularProgressIndicator(),
      ],
    );
  }

  DataRow recentOrderDataRow(Order order, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Text(order.orderId.toString()),
        ),
        DataCell(Text(order.orderdate!.toDate().toString().split('.').first)),
        DataCell(Text(
          order.status.toString(),
          style: TextStyle(
              color: order.status.toString() == "completed"
                  ? Colors.green.shade400
                  : order.status.toString() == "delivered"
                      ? Colors.lightBlueAccent.shade200
                      : Colors.yellow.shade400),
        )),
        DataCell(Text(order.totalprice.toString() + " \$")),
        //DataCell(Text(order.uId.toString())),
        DataCell(buildDropDownList(context, order.list_of_status!, order)),
      ],
    );
  }

  buildDropDownList(BuildContext context, List<String> list, Order order) {
    return DropdownButton<String>(
      value: "view",
      items: list.map((String orderstatus) {
        return DropdownMenuItem<String>(
          value: orderstatus,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Container(
                width: 100,
                child: Text(
                  orderstatus,
                  style: TextStyle(
                      color: orderstatus.toString() == "completed"
                          ? Colors.green.shade400
                          : orderstatus.toString() == "view"
                              ? Colors.white70
                              : Colors.blue.shade400),
                )),
          ),
        );
      }).toList(),
      onChanged: (value) {
        print(value);
        if (value! == "view")
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ViewOrderScreen(order)));
        else {
          context.read<OrdersController>()
            ..onchangeOrderStatus(order.orderId.toString(), value);
        }
      },
    );
  }
}
