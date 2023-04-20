import 'package:shop_mart/core/store.dart';
import 'package:shop_mart/models/shop_product.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

  // void add(ShopProducts item) {
  //   _productIds.add(item.id);
  // }

  void remove(ShopProducts item) {
    _productIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final ShopProducts item;

  AddMutation(this.item);

  @override
  perform() {
    store!.cart._productIds.add(item.id);
  }
}
