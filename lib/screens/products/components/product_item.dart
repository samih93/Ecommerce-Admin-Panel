import 'package:ecommerce_admin_panel/models/prdouct.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    Size size = Utils.getscreensize(context);
    print("width : " +
        size.width.toString() +
        "  -  height :" +
        size.height.toString());

    //  final color = Utils(context).color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: Responsive.isDesktop(context)
                              ? size.width * 0.14
                              : Responsive.isTablet(context)
                                  ? size.width * 0.25
                                  : Responsive.isBigMobile(context)
                                      ? size.width * 0.4
                                      : size.width * .6,
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                            color: const Color(0xff7c94b6),
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop),
                              image: NetworkImage(
                                '${product.images?.first}',

                                // width: screenWidth * 0.12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PopupMenuButton(
                      icon: Icon(
                        Icons.more_vert_rounded,
                        color: secondaryColor,
                      ),
                      color: secondaryColor,
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              onTap: () {},
                              child: Text('Edit'),
                              value: 1,
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                              value: 2,
                            ),
                          ]),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.name}",
                      style: TextStyle(fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${product.price} \$",
                      style:
                          TextStyle(color: Colors.green.shade400, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
