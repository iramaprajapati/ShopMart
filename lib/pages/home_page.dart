import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/widgets/product_widget.dart';
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
                ShopProductsList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ShopMartHeader extends StatelessWidget {
  const ShopMartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Shop Mart".text.xl5.bold.color(Colors.blue).make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}

class ShopProductsList extends StatelessWidget {
  const ShopProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ShopProductsModel.products!.length,
      itemBuilder: (context, index) {
        final products = ShopProductsModel.products![index];
        return ProductsList(catalog: products);
      },
    );
  }
}

class ProductsList extends StatelessWidget {
  final ShopProducts catalog;
  const ProductsList({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl.color(Colors.deepPurple).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              2.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "Buy".text.make())
                ],
              )
            ],
          ),
        ))
      ],
    )).gray100.rounded.square(140).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(Colors.white)
        .make()
        .p16()
        .w40(context);
  }
}
