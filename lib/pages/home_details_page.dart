import 'package:flutter/material.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:shop_mart/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final ShopProducts catalog;
  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.grey[200],
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.all(16),
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: catalog,
            ).wh(150, 50)
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h40(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: Colors.grey[200],
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(Colors.deepPurple)
                            .bold
                            .make(),
                        5.heightBox,
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle)
                            .make(),
                        "Sed erat eos et erat rebum labore, sed aliquyam stet sanctus sed ea lorem duo ipsum, ipsum ipsum sadipscing et tempor, invidunt dolor consetetur ut est takimata, elitr dolor ipsum sit ipsum invidunt eirmod et et. No duo amet aliquyam ut, ea et sed gubergren no kasd kasd sit sit."
                            .text
                            .xl
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py64(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
