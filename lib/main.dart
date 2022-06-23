import 'package:ecommerce_admin_panel/controllers/MenuController.dart';
import 'package:ecommerce_admin_panel/controllers/auth_controller.dart';
import 'package:ecommerce_admin_panel/controllers/product_controller.dart';
import 'package:ecommerce_admin_panel/screens/main/main_screen.dart';
import 'package:ecommerce_admin_panel/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'shared/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD3s3p9zdjbfEJSwZrhahRtNistl74gZjc", // Your apiKey
      appId: "1:376638970514:web:df23816e8a87af839ae44b", // Your appId
      messagingSenderId: "376638970514", // Your messagingSenderId
      projectId: "ecommere-7b5c6", // Your projectId
    ),
  );
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
            create: (context) => AuthController(),
          ),
          ChangeNotifierProxyProvider<AuthController, MenuController>(
            update: (context, auth, previousMessages) => MenuController(auth),
            create: (BuildContext context) => MenuController(null),
          ),
          ChangeNotifierProvider(
            create: (context) => ProductController()..getAllorders(),
          ),
        ],
        child: MainScreen(),
      ),
    );
  }
}
