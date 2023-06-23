import 'package:flutter/material.dart';
import 'package:shop_mart/core/store.dart';
import 'package:shop_mart/pages/cart_page.dart';
import 'package:shop_mart/pages/home_page.dart';
import 'package:shop_mart/pages/login_page.dart';
import 'package:shop_mart/utilities/routes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(), child: const ShopMart()));
}

class ShopMart extends StatelessWidget {
  const ShopMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.cartPageRoute: (context) => const MyCartPage(),
      },
    );
  }
}
