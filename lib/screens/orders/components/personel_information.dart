import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/material.dart';

class PersonelInformation extends StatelessWidget {
  Order order;
  PersonelInformation(this.order);

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

  profileimage(String image) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: order.personelInformation!.pic.toString() == "" ||
              order.personelInformation!.pic == null
          ? AssetImage('assets/images/deafult_profile.png') as ImageProvider
          : NetworkImage('${order.personelInformation!.pic}'),
    );
  }
}
