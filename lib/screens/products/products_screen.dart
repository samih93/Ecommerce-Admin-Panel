import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  GlobalKey _globalKey = GlobalKey();
  double width = 0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      width = _globalKey.currentContext!.size!.width;
      print('the new height is $width');
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = Utils.getscreensize(context);
    return SingleChildScrollView(
      child: Container(
        color: Colors.green,
        width: double.infinity,
        key: _globalKey,
        child: Center(
          child: Wrap(
            children: [
              Container(
                height: Responsive.isDesktop(context)
                    ? _size.height * .45
                    : _size.height * 0.3,
                width: !Responsive.isMobile(context) ? width / 3 : width / 2,
                padding: EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Image.asset(
                  'assets/images/demo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                child: Container(
                  height: Responsive.isDesktop(context)
                      ? _size.height * .45
                      : _size.height * 0.3,
                  width: !Responsive.isMobile(context) ? width / 3 : width / 2,
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    'assets/images/demo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: Responsive.isDesktop(context)
                      ? _size.height * .45
                      : _size.height * 0.3,
                  width: !Responsive.isMobile(context) ? width / 3 : width / 2,
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    'assets/images/demo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: Responsive.isDesktop(context)
                      ? _size.height * .45
                      : _size.height * 0.3,
                  width: !Responsive.isMobile(context) ? width / 3 : width / 2,
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    'assets/images/demo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: Responsive.isDesktop(context)
                      ? _size.height * .45
                      : _size.height * 0.3,
                  width: !Responsive.isMobile(context) ? width / 3 : width / 2,
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Image.asset(
                    'assets/images/demo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
