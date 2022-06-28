import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/controllers/auth_controller.dart';
import 'package:ecommerce_admin_panel/controllers/dashboard_controller.dart';
import 'package:ecommerce_admin_panel/controllers/product_controller.dart';
import 'package:ecommerce_admin_panel/main.dart';
import 'package:ecommerce_admin_panel/models/menu_model.dart';
import 'package:ecommerce_admin_panel/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce_admin_panel/screens/main/main_screen.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:ecommerce_admin_panel/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          Consumer<MenuController>(
            builder: (context, menuController, child) =>
                DrawerListTile(listOfModel: menuController.menuModelList),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.listOfModel,
    // required this.press,
  }) : super(key: key);

  final List<MenuModel> listOfModel;
  //final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    List<Widget> _list_of_listTile = [];
    for (int i = 0; i < listOfModel.length; i++)
      _list_of_listTile.add(InkWell(
        // hoverColor: Colors.grey.withOpacity(0.3),
        child: Container(
          color: listOfModel[i].isselected!
              ? Colors.grey.withOpacity(0.3)
              : secondaryColor,
          child: ListTile(
            selected: true,
            selectedColor: Colors.grey.shade400,
            onTap: () async {
              if (i != 8) {
                if (context.read<MenuController>().isInMainScreen == false) {
                  context.read<MenuController>()..onChangeSelectedMenu(i);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                } else {
                  context.read<MenuController>().onChangeSelectedMenu(i);
                }
                // if (i == 2)
                //   await context.read<ProductController>()
                //     ..getallProduct();

                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context)) Navigator.pop(context);
              } else {
                context.read<AuthController>()
                  ..SignOut().then((value) {
                    context.read<MenuController>()..buildMenu();
                  });
              }
              // if (i == 0) {
              //   context.read<DashBoardController>()..getAllorders();
              // }
            },
            horizontalTitleGap: 0.0,
            leading: SvgPicture.asset(
              listOfModel[i].svgSrc!,
              color: Colors.white54,
              height: 16,
            ),
            title: Text(
              listOfModel[i].title!,
              style: TextStyle(color: Colors.white54),
            ),
          ),
        ),
      ));
    return Column(
      children: [..._list_of_listTile],
    );
  }
}
