// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShopProductsModel {
  static List<ShopProducts>? products;

  // Get Shop Products by ID
  ShopProducts getById(int id) =>
      // ignore: null_closures
      products!.firstWhere((element) => element.id == id, orElse: null);

  ShopProducts getByPosition(int pos) => products![pos];
}

class ShopProducts {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  ShopProducts(
    this.id,
    this.name,
    this.desc,
    this.price,
    this.color,
    this.image,
  );

  /*factory ShopProducts.fromMap(Map<String, dynamic> map) {
    return ShopProducts(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };*/

  ShopProducts copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return ShopProducts(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory ShopProducts.fromMap(Map<String, dynamic> map) {
    return ShopProducts(
      map['id'] as int,
      map['name'] as String,
      map['desc'] as String,
      map['price'] as num,
      map['color'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopProducts.fromJson(String source) =>
      ShopProducts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShopProducts(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant ShopProducts other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
