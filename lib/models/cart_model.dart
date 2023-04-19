import 'package:shop_mart/models/shop_product.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

// Shop Products Model field.
  late ShopProductsModel _products;
//Collection of products IDs.
  // ignore: unused_field
  final List<int> _productIds = [];

  //Get Shop Products
  ShopProductsModel get product => _products;
  set product(ShopProductsModel newProduct) {
    // ignore: unnecessary_null_comparison
    assert(newProduct != null);
    _products = newProduct;
  }

  //Get Products in Cart
  List<ShopProducts> get products =>
      _productIds.map((id) => _products.getById(id)).toList();

  // Get Total Price
  num get totalPrice =>
      products.fold(0, (total, current) => total + current.price);

  void add(ShopProducts item) {
    _productIds.add(item.id);
  }

  void remove(ShopProducts item) {
    _productIds.remove(item.id);
  }
}
