import 'package:ecommerce_admin_panel/controllers/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/screens/dashboard/components/orders.dart';
import 'package:ecommerce_admin_panel/screens/dashboard/components/pie_chart.dart';
import 'package:ecommerce_admin_panel/screens/dashboard/components/radial_chart.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/constants.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<OrdersController>().isloadingGetAllProduct
        ? CircularProgressIndicator()
        : Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Orders(),
                        SizedBox(height: defaultPadding),
                        //RecentFiles(),
                        // if (Responsive.isMobile(context))
                        //   SizedBox(height: defaultPadding),
                        !Responsive.isMobile(context)
                            ? Row(
                                children: [
                                  Expanded(child: PieChart()),
                                  SizedBox(width: defaultPadding),
                                  Expanded(child: RadialChart()),
                                ],
                              )
                            : Column(
                                children: [
                                  PieChart(),
                                  SizedBox(
                                    height: defaultPadding,
                                  ),
                                  RadialChart(),
                                ],
                              ),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  // if (!Responsive.isMobile(context))
                  //   Expanded(
                  //     flex: 2,
                  //     child: StarageDetails(),
                  //   ),
                ],
              )
            ],
          );
  }
}
