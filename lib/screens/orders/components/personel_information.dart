import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/material.dart';

class PersonelInformation extends StatelessWidget {
  Order order;
  PersonelInformation(this.order);

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
            "Pesronel Information",
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
                              width: Responsive.isDesktop(context) ? 150 : 80,
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
                            order.personelInformation!.name.toString(),
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
                              width: Responsive.isDesktop(context) ? 150 : 80,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            order.personelInformation!.email.toString(),
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
                              width: Responsive.isDesktop(context) ? 150 : 80,
                              child: Text(
                                "User Id",
                                style: TextStyle(
                                    fontSize: !Responsive.isDesktop(context)
                                        ? 15
                                        : 25),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            order.personelInformation!.userId.toString(),
                            style: TextStyle(
                                color: Colors.green.shade300,
                                fontSize:
                                    !Responsive.isDesktop(context) ? 15 : 25),
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
