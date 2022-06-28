import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShippingAddress extends StatelessWidget {
  Order order;
  ShippingAddress(this.order);

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
                "Shipping Address",
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(width: 100, child: Text("Name")),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      order.shippingAddress!.firstname.toString() +
                          " " +
                          order.shippingAddress!.lastname.toString(),
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
                    Container(width: 100, child: Text("Phone")),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      order.shippingAddress!.country.toString() +
                          " " +
                          order.shippingAddress!.phone.toString(),
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
                    Container(width: 100, child: Text("Address")),
                    SizedBox(
                      width: 100,
                    ),
                    Expanded(
                      child: Text(
                        order.shippingAddress!.location.toString() +
                            " - " +
                            order.shippingAddress!.city.toString() +
                            " - " +
                            order.shippingAddress!.state.toString(),
                        style: TextStyle(color: Colors.green.shade300),
                      ),
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
