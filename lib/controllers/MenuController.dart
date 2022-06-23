import 'package:ecommerce_admin_panel/models/menu_model.dart';
import 'package:ecommerce_admin_panel/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce_admin_panel/screens/products/products_screen.dart';
import 'package:ecommerce_admin_panel/screens/transactions/transactions.dart';
import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final screens = [
    DashboardScreen(),
    TransactionsScreen(),
    ProductScreen(),
    TransactionsScreen(),
    TransactionsScreen(),
    TransactionsScreen(),
    TransactionsScreen(),
    TransactionsScreen(),
  ];

  final screens_title = [
    'Dashboard',
    'Transaction',
    'Products',
    'Documents',
    'Store',
    'Notification',
    'Profile',
    'Settings'
  ];

  List<MenuModel> menuModelList = [
    MenuModel("Dashboard", "assets/icons/menu_dashbord.svg", isselected: true),
    MenuModel("Transaction", "assets/icons/menu_tran.svg"),
    MenuModel("Products", "assets/icons/menu_task.svg"),
    MenuModel("Documents", "assets/icons/menu_doc.svg"),
    MenuModel("Store", "assets/icons/menu_store.svg"),
    MenuModel("Notification", "assets/icons/menu_notification.svg"),
    MenuModel("Profile", "assets/icons/menu_profile.svg"),
    MenuModel("Settings", "assets/icons/menu_setting.svg"),
  ];

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  int currentSelectedIndex = 0;

  void onChangeSelectedMenu(index) {
    print(index);
    for (int i = 0; i < menuModelList.length; i++) {
      if (i == index) {
        print(menuModelList[i].title.toString() + " selected");
        menuModelList[i].isselected = true;
      } else
        menuModelList[i].isselected = false;
    }
    currentSelectedIndex = index;
    // menuModelList.forEach((element) {
    //   print(element.title.toString() + " - " + element.isselected.toString());
    // });
    notifyListeners();
  }
}
