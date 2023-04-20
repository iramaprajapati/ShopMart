import 'package:flutter/material.dart';
import 'package:shop_mart/core/store.dart';
import 'package:shop_mart/models/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Cart".text.make(),
      ),
      body: Column(
        children: [
          CardList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});
  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${cart.totalPrice}".text.xl5.color(Colors.indigo).make(),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet..!".text.make()));
                  },
                  child: "Buy".text.xl2.make())
              .w32(context)
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel cart = (VxState.store as MyStore).cart;
    return cart.products.isEmpty
        ? "Empty Cart !!".text.xl3.bold.makeCentered()
        : ListView.builder(
            itemCount: cart.products.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {
                    cart.remove(cart.products[index]);
                  },
                  icon: Icon(Icons.remove_circle_outline)),
              title: cart.products[index].name.text.make(),
            ),
          );
  }
}
