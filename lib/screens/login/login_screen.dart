import 'package:ecommerce_admin_panel/screens/login/components/login_form.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
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
        height: _size.width > 1100
            ? _size.width * .4
            : _size.width > 850
                ? _size.width * .7
                : _size.width * 0.7,
        width: _size.width > 1100
            ? _size.width * .4
            : _size.width > 850
                ? _size.width * .7
                : _size.width * 0.7,
        padding: EdgeInsets.all(defaultPadding),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: LoginForm(),
        ));
  }
}
