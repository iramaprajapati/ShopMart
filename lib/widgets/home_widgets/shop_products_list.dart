import 'package:flutter/material.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/pages/home_details_page.dart';
import 'package:shop_mart/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';

class ShopProductsList extends StatelessWidget {
  const ShopProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ShopProductsModel.products!.length,
      itemBuilder: (context, index) {
        final products = ShopProductsModel.products![index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailsPage(catalog: products),
              )),
          child: ProductsList(catalog: products),
        );
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
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),
        ),
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
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(
                    catalog: catalog,
                  )
                ],
              )
            ],
          ),
        ))
      ],
    )).gray100.rounded.square(140).make().py16();
  }
}
