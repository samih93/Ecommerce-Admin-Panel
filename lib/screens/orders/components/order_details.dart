import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderDetails extends StatelessWidget {
  Order order;
  OrderDetails(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
      ),
      width: !Responsive.isDesktop(context) ? 400 : 650,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details Order",
            style: TextStyle(fontSize: 30),
          ),
          Divider(
            thickness: 2,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              //  width: Utils.getscreensize(context).width * 0.5,
              // Name
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: Responsive.isDesktop(context) ? 150 : 100,
                              child: Text(
                                "Order Id",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            order.orderId.toString(),
                            style: TextStyle(
                                color: Colors.green.shade300,
                                fontSize:
                                    !Responsive.isDesktop(context) ? 15 : 25),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Phone
                      Row(
                        children: [
                          Container(
                              width: Responsive.isDesktop(context) ? 150 : 100,
                              child: Text(
                                "Order Date",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            order.orderdate!
                                .toDate()
                                .toString()
                                .split('.')
                                .first
                                .toString(),
                            style: TextStyle(
                                color: Colors.green.shade300,
                                fontSize:
                                    !Responsive.isDesktop(context) ? 15 : 25),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Phone
                      Row(
                        children: [
                          Container(
                              width: Responsive.isDesktop(context) ? 150 : 100,
                              child: Text(
                                "Order Status",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            order.status.toString(),
                            style: TextStyle(
                                color: Colors.green.shade300,
                                fontSize:
                                    !Responsive.isDesktop(context) ? 15 : 25),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Phone
                      Row(
                        children: [
                          Container(
                              width: Responsive.isDesktop(context) ? 150 : 100,
                              child: Text("Total Price",
                                  style: TextStyle(
                                      fontSize: !Responsive.isDesktop(context)
                                          ? 15
                                          : 25))),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${order.totalprice.toString()} \$',
                            style: TextStyle(
                                color: Colors.green.shade300,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
