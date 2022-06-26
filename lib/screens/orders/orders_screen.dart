import 'package:data_table_2/data_table_2.dart';
import 'package:ecommerce_admin_panel/controllers/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: DataTable2(
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
          context.read<OrdersController>().allOrders.length,
          (index) => recentOrderDataRow(
              context.read<OrdersController>().allOrders[index]),
        ),
      ),
    );
  }

  DataRow recentOrderDataRow(Order order) {
    return DataRow(
      cells: [
        DataCell(
          Text(order.orderId.toString()),
        ),
        DataCell(Text(order.orderdate!.toDate().toString().split('.').first)),
        DataCell(Text(
          order.status.toString(),
          style: TextStyle(
              color: order.status.toString().toLowerCase() == "completed"
                  ? Colors.green.shade400
                  : Colors.red.shade400),
        )),
        DataCell(Text(order.totalprice.toString() + " \$")),
        //DataCell(Text(order.uId.toString())),
        DataCell(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MaterialButton(
                  onPressed: () {},
                  child: Text("Edit"),
                  color: Colors.red.shade400),
              SizedBox(
                width: 8,
              ),
              MaterialButton(
                  onPressed: () {},
                  child: Text("View"),
                  color: Colors.blue.shade400),
            ],
          ),
        )),
      ],
    );
  }
}
