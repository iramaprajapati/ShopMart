import 'package:flutter/material.dart';
import 'package:shop_mart/pages/home_page.dart';
import 'package:shop_mart/pages/login_page.dart';

void main() {
  runApp(ShopMart());
}

class ShopMart extends StatelessWidget {
  const ShopMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/HomePage",
      routes: {
        "/": (context) => LoginPage(),
        "/HomePage": (context) => HomePage(),
        "/LoginPage": (context) => LoginPage(),
      },
    );
  }
}
