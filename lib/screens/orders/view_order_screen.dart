import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/screens/main/components/side_menu.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Order"),
        flexibleSpace: Container(color: bgColor),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Container(
            //  width: double.infinity,
            child: Column(
              children: [
                orderDetails(context),
                SizedBox(
                  height: 20,
                ),
                personelInformation(context),
                SizedBox(
                  height: 20,
                ),
                shippingAddress(context),
                SizedBox(
                  height: 20,
                ),
                orderItems(context, order)
              ],
            ),
          ),
        ),
      ),
    );
  }

  orderDetails(BuildContext context) {
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

  personelInformation(BuildContext context) {
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
                "Pesronel Information",
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
                    if (Responsive.isMobile(context))
                      Column(
                        children: [
                          profileimage(
                              order.personelInformation!.pic.toString()),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    Row(
                      children: [
                        Container(width: 100, child: Text("Name")),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          order.personelInformation!.name.toString(),
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
                        Container(width: 100, child: Text("Email")),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          order.personelInformation!.email.toString(),
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
                        Container(width: 100, child: Text("User Id")),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          order.personelInformation!.userId.toString(),
                          style: TextStyle(color: Colors.green.shade300),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                if (!Responsive.isMobile(context))
                  profileimage(order.personelInformation!.pic.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }

  shippingAddress(BuildContext context) {
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

  profileimage(String image) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: order.personelInformation!.pic.toString() == "" ||
              order.personelInformation!.pic == null
          ? AssetImage('assets/images/deafult_profile.png') as ImageProvider
          : NetworkImage('${order.personelInformation!.pic}'),
    );
  }

  orderItems(BuildContext context, Order order) {
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
