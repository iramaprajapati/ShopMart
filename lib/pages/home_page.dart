import 'package:flutter/material.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/widgets/drawer.dart';
import 'package:shop_mart/widgets/product_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final int days = 30;
  final String name = "Rama";

  @override
  Widget build(BuildContext context) {
    final dummyList =
        List.generate(20, (index) => ShopProductsModel.products[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Mart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              products: dummyList[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
