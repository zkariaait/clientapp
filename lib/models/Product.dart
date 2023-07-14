import 'dart:convert';

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
