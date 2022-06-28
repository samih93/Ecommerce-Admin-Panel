import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderDetails extends StatelessWidget {
  Order order ;
 OrderDetails(this.order) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Divider()),
              SizedBox(
                width: 10,
              ),
              Text(
                "Details Order",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(child: Divider()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //  width: Utils.getscreensize(context).width * 0.5,
            // Name
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(width: 100, child: Text("Order Id")),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          order.orderId.toString(),
                          style: TextStyle(color: Colors.green.shade300),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Phone
                    Row(
                      children: [
                        Container(width: 100, child: Text("Order Date")),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          order.orderdate!
                              .toDate()
                              .toString()
                              .split('.')
                              .first
                              .toString(),
                          style: TextStyle(color: Colors.green.shade300),
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
                        Container(width: 100, child: Text("Order Status")),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          order.status.toString(),
                          style: TextStyle(color: Colors.green.shade300),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Phone
                    Row(
                      children: [
                        Container(width: 100, child: Text("Total Price")),
                        SizedBox(
                          width: 100,
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
          )
        ],
      ),
    );
  }
}