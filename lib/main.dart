import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/controllers/product_controller.dart';
import 'package:ecommerce_admin_panel/controllers/studentController.dart';
import 'package:ecommerce_admin_panel/screens/main/main_screen.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'shared/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  //DesktopWindow.setMinWindowSize(Size(1300, 800));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
          ChangeNotifierProvider(
            create: (context) => StudentController(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductController(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
