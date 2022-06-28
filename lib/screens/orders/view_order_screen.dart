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

    return Scaffold(
      key: context.read<MenuController>().getviewOrderscaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: ListView(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        if (authprovider.currentuserModel != null)
                          Header(
                            fct: () {
                              context
                                  .read<MenuController>()..viewOrder_controlMenu();
                            },
                          ),
                        SizedBox(height: defaultPadding),
                        Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Container(
                            //  width: double.infinity,
                            child: Column(
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
