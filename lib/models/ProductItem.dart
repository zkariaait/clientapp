import 'dart:convert';

import 'Product.dart';

class ProductItem {
  int quantity;
  Product product;

  ProductItem({
    this.quantity = 1,
    required this.product,
  });

  factory ProductItem.fromJson(String source) =>
      ProductItem.fromMap(json.decode(source));

  factory ProductItem.fromMap(Map<String, dynamic> map) {
    return ProductItem(
      quantity: map['quantity'],
      product: Product.fromMap(map['product']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'product': product.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
