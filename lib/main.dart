import 'package:flutter/material.dart';

void main(){
  runApp(ShopMart());
}

class ShopMart extends StatelessWidget {
  const ShopMart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("Welcome to Rama Shop Mart..!!"),
          ),
        ),
      ),
    );
  }
}