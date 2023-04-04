import 'package:flutter/material.dart';
import 'package:shop_mart/models/shop_product.dart';

class ProductWidget extends StatelessWidget {
  final ShopProducts products;

  const ProductWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //   onTap: () {
        //     print("${products.name} is clicked..!");
        //   },
        leading: Image.network(products.image),
        title: Text(products.name),
        subtitle: Text(products.desc),
        trailing: Text("\$${products.price.toString()}",
            textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}
