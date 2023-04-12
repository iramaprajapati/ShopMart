import 'package:flutter/material.dart';
import 'package:shop_mart/pages/cart_page.dart';
import 'package:shop_mart/pages/home_page.dart';
import 'package:shop_mart/pages/login_page.dart';
import 'package:shop_mart/utilities/routes.dart';

void main() {
  runApp(ShopMart());
}

class ShopMart extends StatelessWidget {
  const ShopMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartPageRoute: (context) => MyCartPage(),
      },
    );
  }
}
