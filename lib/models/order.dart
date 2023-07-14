import 'dart:convert';

class Order {
  String firstName;
  String lastName;
  List<ProductItem> productItems;
  double total;

  Order({
    required this.firstName,
    required this.lastName,
    required this.productItems,
    required this.total,
  });

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      firstName: map['FirstName'],
      lastName: map['LastName'],
      productItems: List<ProductItem>.from(
        map['Items'].map((x) => ProductItem.fromMap(x)),
      ),
      total: map['Total'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Items': productItems.map((x) => x.toMap()).toList(),
      'Total': total,
    };
  }

  String toJson() => json.encode(toMap());
}

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

class Product {
  String id;
  String title;
  String image;
  String description;
  double price;
  bool isLiked;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.isLiked,
  });

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      image: map['image'],
      description: map['description'],
      price: map['price'],
      isLiked: map['isLiked'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'price': price,
      'isLiked': isLiked,
    };
  }

  String toJson() => json.encode(toMap());
}
