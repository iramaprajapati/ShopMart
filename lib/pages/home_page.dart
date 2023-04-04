import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/widgets/drawer.dart';
import 'package:shop_mart/widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Rama";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final shop_productJson =
        await rootBundle.loadString("assets/files/shop_products.json");
    final decodedData = jsonDecode(shop_productJson);
    var productsData = decodedData["products"];
    ShopProductsModel.products = List.from(productsData)
        .map<ShopProducts>((products) => ShopProducts.fromMap(products))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Mart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ShopProductsModel.products.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              products: ShopProductsModel.products[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
