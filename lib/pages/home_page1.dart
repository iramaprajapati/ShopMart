import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/widgets/drawer.dart';

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
    await Future.delayed(Duration(seconds: 2));
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
        child: (ShopProductsModel.products != null &&
                ShopProductsModel.products!.isNotEmpty)
            ? /*ListView.builder(
                itemCount: ShopProductsModel.products!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    products: ShopProductsModel.products![index],
                  );
                },
              )*/
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final product = ShopProductsModel.products![index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GridTile(
                      header: Container(
                        child: Text(
                          product.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.deepPurple),
                      ),
                      footer: Container(
                        child: Text(
                          "\$${product.price.toString()}",
                          style: TextStyle(color: Colors.white),
                        ),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.blueGrey),
                      ),
                      child: Image.network(product.image),
                    ),
                  );
                },
                itemCount: ShopProductsModel.products!.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
