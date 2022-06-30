import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderItems extends StatelessWidget {
  Order order;
  OrderItems(this.order);

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getscreensize(context);
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
            "Order Items",
            style: TextStyle(fontSize: 30),
          ),
          Divider(
            thickness: 2,
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
                        // maxHeight: Responsive.isMobile(context)
                        //     ? size.width * .38
                        //     : Responsive.isTablet(context)
                        //         ? size.width * 0.3
                        //         : size.width * 0.2),
                        ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // width: Responsive.isMobile(context)
                          //     ? size.width * .3
                          //     : Responsive.isBigMobile(context)
                          //         ? size.width * 0.25
                          //         : Responsive.isTablet(context)
                          //             ? size.width * 0.24
                          //             : 0.2,
                          // height: Responsive.isMobile(context)
                          //     ? size.width * .35
                          //     : Responsive.isTablet(context)
                          //         ? size.width * 0.25
                          //         : size.width * 0.17,
                          child: item.image != ""
                              ? Flexible(
                                  child: Image.network(
                                    item.image.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Image.asset(
                                  "assets/images/deafult_product.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
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
                                  height: 10,
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
