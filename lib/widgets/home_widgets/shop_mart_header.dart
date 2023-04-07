import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
