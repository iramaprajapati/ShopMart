import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_mart/core/store.dart';
import 'package:shop_mart/models/cart_model.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/utilities/routes.dart';
import 'package:shop_mart/widgets/home_widgets/shop_mart_header.dart';
import 'package:shop_mart/widgets/home_widgets/shop_products_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Rama";
  final String url = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // final shop_productJson =
    //     await rootBundle.loadString("assets/files/shop_products.json");

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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPageRoute),
          child: const Icon(CupertinoIcons.cart),
        ).badge(
            color: Vx.red500,
            size: 20,
            count: _cart.products.length,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white)),
      ),
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
