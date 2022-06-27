import 'package:ecommerce_admin_panel/screens/login/components/login_form.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:ecommerce_admin_panel/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = Utils.getscreensize(context);

    return Container(
        color: secondaryColor,
        height: Responsive.isDesktop(context)
            ? _size.width * .4
            : Responsive.isTablet(context)
                ? _size.width * .7
                : _size.width * 0.9,
        width: Responsive.isDesktop(context)
            ? _size.width * .4
            : Responsive.isTablet(context)
                ? _size.width * .7
                : _size.width * 0.9,
        padding:
            EdgeInsets.all(!Responsive.isMobile(context) ? defaultPadding : 8),
        child: LoginForm());
  }
}
