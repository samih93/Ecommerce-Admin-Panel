import 'package:ecommerce_admin_panel/controllers/product_controller.dart';
import 'package:ecommerce_admin_panel/screens/products/components/product_item.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = Utils.getscreensize(context);
    return context.watch<ProductController>().isloadingGetProduct
        ? CircularProgressIndicator()
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
                context.watch<ProductController>().list_of_product.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isDesktop(context)
                  ? 4
                  : Responsive.isTablet(context)
                      ? 3
                      : Responsive.isBigMobile(context)
                          ? 2
                          : 1,
              childAspectRatio: Responsive.isMobile(context) ? 1.1 : 0.8,
              crossAxisSpacing: defaultPadding - 4,
              mainAxisSpacing: defaultPadding - 4,
            ),
            itemBuilder: (context, index) {
              return ProductItem(
                  context.watch<ProductController>().list_of_product[index]);
            });
    // return Column(
    //                 children: [
    //                   Responsive(
    //                     mobile: ProductGridWidget(
    //                       crossAxisCount: size.width < 650 ? 2 : 4,
    //                       childAspectRatio:
    //                           size.width < 650 && size.width > 350 ? 1.1 : 0.8,
    //                     ),
    //                     desktop: ProductGridWidget(
    //                       childAspectRatio: size.width < 1400 ? 0.8 : 1.05,
    //                     ),
    //                   );
  }
}
