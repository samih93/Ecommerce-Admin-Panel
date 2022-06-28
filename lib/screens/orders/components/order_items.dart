import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderItems extends StatelessWidget {
  Order order;
  OrderItems(this.order);

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
                "Order Items",
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
          // Items

          ...order.orderItems!.map((item) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: Responsive.isMobile(context)
                            ? Utils.getscreensize(context).width * .35
                            : Responsive.isTablet(context)
                                ? Utils.getscreensize(context).width * 0.25
                                : Utils.getscreensize(context).width * 0.17),
                    child: Row(
                      children: [
                        Container(
                          width: Responsive.isMobile(context)
                              ? Utils.getscreensize(context).width * .35
                              : Responsive.isTablet(context)
                                  ? Utils.getscreensize(context).width * 0.25
                                  : Utils.getscreensize(context).width * 0.17,
                          height: Responsive.isMobile(context)
                              ? Utils.getscreensize(context).width * .35
                              : Responsive.isTablet(context)
                                  ? Utils.getscreensize(context).width * 0.25
                                  : Utils.getscreensize(context).width * 0.17,
                          child: item.image != ""
                              ? Image.network(
                                  item.image.toString(),
                                  fit: BoxFit.fill,
                                )
                              : Image.asset(
                                  "assets/images/deafult_product.png"),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Product Id  :  ' ${item.productId.toString()} '",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${item.name.toString()}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Size : ${item.size.toString()}"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${item.price.toString()} * ${item.quantity.toString()}",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Divider(),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
