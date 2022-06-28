import 'package:ecommerce_admin_panel/models/MyFiles.dart';
import 'package:ecommerce_admin_panel/models/ordermodel.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../shared/constants.dart';

class OrderInfoCard extends StatelessWidget {
  const OrderInfoCard({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderInfo order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          !Responsive.isMobile(context) || !Responsive.isTablet(context)
              ? defaultPadding
              : 5),
      height: !Responsive.isMobile(context)
          ? Utils.getscreensize(context).height * 0.2
          : Utils.getscreensize(context).height * 0.3,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: order.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: SvgPicture.asset(
                  'assets/icons/Documents.svg',
                  color: order.color!,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.white54)
            ],
          ),
          FittedBox(
            child: Text(
              order.title!,
              style: TextStyle(fontSize:  20),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (order.title != "All Orders")
            ProgressLine(
              color: order.color,
              percentage: order.percentage!,
            ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(
                    !Responsive.isMobile(context) ? defaultPadding * 0.75 : 3),
                height: !Responsive.isMobile(context) ? 60 : 30,
                width: !Responsive.isMobile(context) ? 50 : 25,
                decoration: BoxDecoration(
                  color: order.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Center(
                  child: Text(
                    order.numOfOrders.toString(),
                    style: TextStyle(
                        color: order.color!,
                        fontSize: !Responsive.isMobile(context) ? 22 : 18),
                  ),
                ),
              ),
              // Text(
              //   order.totalStorage!,
              //   style: Theme.of(context)
              //       .textTheme
              //       .caption!
              //       .copyWith(color: Colors.white),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
