import 'package:flutter/material.dart';
import 'package:shop_mart/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int days = 30;
  final String name = "Rama";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Mart"),
      ),
      body: Center(
        child: Container(
          child: Text(
              "Welcome to $name Shop Mart..!! \n Offer available on $days days.."),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
