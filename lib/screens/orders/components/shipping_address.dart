import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShippingAddress extends StatelessWidget {
  Order order;
  ShippingAddress(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
      ),
      width: !Responsive.isDesktop(context) ? 400 : 650,
      height: !Responsive.isDesktop(context) ? 300 : 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shipping Address",
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
                                "Name",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            order.shippingAddress!.firstname.toString() +
                                " " +
                                order.shippingAddress!.lastname.toString(),
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
                                "Phone",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            order.shippingAddress!.country.toString() +
                                " " +
                                order.shippingAddress!.phone.toString(),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: Responsive.isDesktop(context) ? 150 : 100,
                              child: Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: !Responsive.isDesktop(context) ? 200 : 350,
                            child: Text(
                              order.shippingAddress!.location.toString() +
                                  " - " +
                                  order.shippingAddress!.city.toString() +
                                  " - " +
                                  order.shippingAddress!.state.toString(),
                              style: TextStyle(
                                  color: Colors.green.shade300,
                                  fontSize:
                                      !Responsive.isDesktop(context) ? 15 : 25),
                              maxLines: 3,
                            ),
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
