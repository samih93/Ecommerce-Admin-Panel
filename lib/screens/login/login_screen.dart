import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/controllers/auth_controller.dart';
import 'package:ecommerce_admin_panel/shared/components/default_button.dart';
import 'package:ecommerce_admin_panel/shared/components/default_text_form.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var text_emailcontroller = TextEditingController();
  var text_passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

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
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login Screen",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 40,
                ),
                defaultTextFormField(
                  controller: text_emailcontroller,
                  inputtype: TextInputType.emailAddress,
                  hinttext: "Email",
                  onvalidate: (value) {
                    if (value!.isEmpty) return "email must not be empty";
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextFormField(
                  controller: text_passwordcontroller,
                  inputtype: TextInputType.visiblePassword,
                  hinttext: "Password",
                  onvalidate: (value) {
                    if (value!.isEmpty) return "password must not be empty";
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                context.watch<AuthController>().isloadingSignIn
                    ? CircularProgressIndicator()
                    : defaultButton(
                        text: "Sign In",
                        height: 50,
                        onpress: () {
                          if (_formkey.currentState!.validate()) {
                            context.read<AuthController>()
                              ..signIn(text_emailcontroller.text.trim(),
                                      text_passwordcontroller.text.toString())
                                  .then((value) {
                                if (value != null) {
                                  text_emailcontroller.clear();
                                  text_passwordcontroller.clear();
                                  print("sign in successfully");
                                  context.read<MenuController>()..buildMenu();
                                } else {}
                              });
                          }
                        }),
              ],
            ),
          ),
        ));
  }
}
