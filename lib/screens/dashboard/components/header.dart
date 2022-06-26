import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/controllers/auth_controller.dart';
import 'package:ecommerce_admin_panel/controllers/orders_controller.dart';
import 'package:ecommerce_admin_panel/controllers/product_controller.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Expanded(
            child: Text(
              "${context.watch<MenuController>().screens_title[context.watch<MenuController>().currentSelectedIndex]}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(flex: 2, child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.JPG",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Consumer<AuthController>(
                builder: (context, controller, child) {
                  return Text(controller.currentuserModel!.email.toString());
                },
              ),
            ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
  }) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (context.read<MenuController>().currentSelectedIndex == 1) {
        } else if (context.read<MenuController>().currentSelectedIndex == 2) {
          context.read<ProductController>().searchproduct(
              value.trim().length > 2 ? value.trim().toString() : '');
        }
      },
      controller: searchController,
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        // suffixIcon: InkWell(
        //   onTap: () {
        //     print(searchController.text);
        //   },
        //   child: Container(
        //     padding: EdgeInsets.all(defaultPadding * 0.75),
        //     margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
        //     decoration: BoxDecoration(
        //       color: primaryColor,
        //       borderRadius: const BorderRadius.all(Radius.circular(10)),
        //     ),
        //     child: SvgPicture.asset("assets/icons/Search.svg"),
        //   ),
        // ),
      ),
    );
  }
}
