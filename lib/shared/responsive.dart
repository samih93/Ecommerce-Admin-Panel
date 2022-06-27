import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      Utils.getscreensize(context).width < 850;

  static bool isTablet(BuildContext context) =>
      Utils.getscreensize(context).width < 1100 &&
      Utils.getscreensize(context).width >= 850;

  static bool isDesktop(BuildContext context) =>
      Utils.getscreensize(context).width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = Utils.getscreensize(context);
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
