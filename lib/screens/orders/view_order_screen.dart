import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/controllers/auth_controller.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/screens/dashboard/components/header.dart';
import 'package:ecommerce_admin_panel/screens/main/components/side_menu.dart';
import 'package:ecommerce_admin_panel/screens/orders/components/order_details.dart';
import 'package:ecommerce_admin_panel/screens/orders/components/order_items.dart';
import 'package:ecommerce_admin_panel/screens/orders/components/personel_information.dart';
import 'package:ecommerce_admin_panel/screens/orders/components/shipping_address.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ViewOrderScreen extends StatelessWidget {
  Order order;

  ViewOrderScreen(this.order);

  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<AuthController>(context);
    // context.read<MenuController>()..onchangeIsInMainScreen();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView(
          controller: ScrollController(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Container(
                //  width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OrderDetails(order),
                    SizedBox(
                      height: 20,
                    ),
                    PersonelInformation(order),
                    SizedBox(
                      height: 20,
                    ),
                    ShippingAddress(order),
                    SizedBox(
                      height: 20,
                    ),
                    OrderItems(order)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
