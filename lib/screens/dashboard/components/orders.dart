import 'package:ecommerce_admin_panel/controllers/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/models/MyOrders.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';
import 'order_info_card.dart';

class Orders extends StatelessWidget {
  const Orders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = Utils.getscreensize(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Orders",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            // ElevatedButton.icon(
            //   style: TextButton.styleFrom(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: defaultPadding * 1.5,
            //       vertical:
            //           defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            //     ),
            //   ),
            //   onPressed: () {},
            //   icon: Icon(Icons.add),
            //   label: Text("Add New"),
            // ),
          ],
        ),
        SizedBox(height: defaultPadding),
        OrderInfoCardGridView(
          crossAxisCount: Responsive.isDesktop(context)
              ? 4
              : Responsive.isTablet(context)
                  ? 3
                  : Responsive.isBigMobile(context)
                      ? 2
                      : 1,
          childAspectRatio: Responsive.isMobile(context)
              ? 1.8
              : Responsive.isBigMobile(context)
                  ? 1.1
                  : Responsive.isTablet(context)
                      ? 1.1
                      : 1.2,
        ),
        // tablet: OrderInfoCardGridView(),
        // desktop: OrderInfoCardGridView(
        //   childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        // ),
      ],
    );
  }
}

class OrderInfoCardGridView extends StatelessWidget {
  const OrderInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => OrderInfoCard(
          order: context.read<OrdersController>().demoMyOrder[index]),
    );
  }
}
