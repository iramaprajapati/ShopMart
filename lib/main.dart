import 'package:flutter/material.dart';
import 'package:shop_mart/home_page.dart';

void main() {
  runApp(ShopMart());
}

class ShopMart extends StatelessWidget {
  const ShopMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
