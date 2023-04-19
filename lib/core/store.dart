// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:shop_mart/models/cart_model.dart';
import 'package:shop_mart/models/shop_product.dart';

class MyStore extends VxStore {
  late ShopProductsModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = ShopProductsModel();
    cart = CartModel();
    cart.product = catalog;
  }
}
