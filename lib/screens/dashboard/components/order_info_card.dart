import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/models/MyFiles.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderInfo order;

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getscreensize(context);
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          switch (order.title) {
            case "All Orders":
              context
                  .read<OrdersController>()
                  .onchangeTableOrderStatus(OrderStatus.all);
              break;
            case "Packaging":
              context
                  .read<OrdersController>()
                  .onchangeTableOrderStatus(OrderStatus.packaging);
              break;
            case "Delivered":
              context
                  .read<OrdersController>()
                  .onchangeTableOrderStatus(OrderStatus.delivered);
              break;
            case "Completed":
              context
                  .read<OrdersController>()
                  .onchangeTableOrderStatus(OrderStatus.completed);
              break;
          }
          context.read<MenuController>().onChangeSelectedMenu(1);
        },
        child: Padding(
          padding: EdgeInsets.all(
              !Responsive.isMobile(context) || !Responsive.isTablet(context)
                  ? defaultPadding
                  : 5),
          child: LayoutBuilder(
            builder: (context, constraints_dashboardItem) => SizedBox(
              // height: 100,
              // width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(defaultPadding * 0.75),
                        // height: 40,
                        // width: 40,
                        decoration: BoxDecoration(
                          color: order.color!.withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Flexible(
                          child: SvgPicture.asset(
                            'assets/icons/Documents.svg',
                            color: order.color!,
                          ),
                        ),
                      ),
                      Icon(Icons.more_vert, color: Colors.white54)
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      order.title!,
                      style: TextStyle(fontSize: 22),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (order.title != "All Orders")
                    ProgressLine(
                      color: order.color,
                      percentage: order.percentage!,
                    ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(!Responsive.isMobile(context)
                            ? defaultPadding * 0.75
                            : 3),
                        height: constraints_dashboardItem.maxHeight / 4,
                        width: constraints_dashboardItem.maxWidth / 4,
                        decoration: BoxDecoration(
                          color: order.color!.withOpacity(0.1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              order.numOfOrders.toString(),
                              style: TextStyle(
                                  color: order.color!,
                                  fontSize:
                                      constraints_dashboardItem.maxHeight / 4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
