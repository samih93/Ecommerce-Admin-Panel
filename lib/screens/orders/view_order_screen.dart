import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/screens/main/components/side_menu.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ViewOrderScreen extends StatelessWidget {
  Order order;

  ViewOrderScreen(this.order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order '${order.orderId}'"),
        flexibleSpace: Container(color: bgColor),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Text("View Order screen"),
      ),
    );
  }
}
