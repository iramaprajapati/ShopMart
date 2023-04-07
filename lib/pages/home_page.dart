import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/widgets/home_widgets/shop_mart_header.dart';
import 'package:shop_mart/widgets/home_widgets/shop_products_list.dart';
import 'package:velocity_x/velocity_x.dart';

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
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopMartHeader(),
              if (ShopProductsModel.products != null &&
                  ShopProductsModel.products!.isNotEmpty)
                ShopProductsList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
