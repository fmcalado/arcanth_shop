import 'package:arcanth_shop/const.dart';
import 'package:flutter/material.dart';

class Product {
  final String id, image, title, category, description;
  final int price;
  final Color bgColor;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

class OrderProduct extends Product {
  final int amount;

  OrderProduct({
    required String id,
    required this.amount,
    required String image,
    required String title,
    required int price,
    required String description,
    required String category,
  }) : super(
          id: id,
          image: image,
          title: title,
          price: price,
          description: description,
          category: category,
        );
}

List<Product> dummyProducts = [
  Product(
    id: "80f32fd4-1cb1-4197-92c9-25406a5ef55c",
    image: "assets/images/product_0.png",
    title: "Blusa Longa Massa",
    category: "Camisas",
    description: lipsum,
    price: 165,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    id: "0de6c327-c80c-46f7-a56b-6b0b4afb6715",
    image: "assets/images/product_1.png",
    title: "Blusa Casual Legal",
    category: "Camisetas",
    description: lipsum,
    price: 99,
  ),
  Product(
    id: "86e03cd3-bf03-4003-8c37-1a3af279a358",
    image: "assets/images/product_2.png",
    title: "Blusa Com Manga Dobrada",
    category: "Camisas",
    description: lipsum,
    price: 180,
    bgColor: const Color(0xFFF8FEFB),
  ),
  Product(
    id: "cdf5c1d0-a75e-44af-bb18-faaa05a7ee43",
    image: "assets/images/product_3.png",
    title: "Blusa Massa",
    category: "Camisetas",
    description: lipsum,
    price: 149,
    bgColor: const Color(0xFFEEEEED),
  ),
];

List<Product> newProducts = [
  Product(
    id: "0de6c327-c80c-46f7-a56b-6b0b4afb6715",
    image: "assets/images/product_1.png",
    title: "Blusa Casual Legal",
    category: "Camisetas",
    description: lipsum,
    price: 99,
  ),
  Product(
    id: "80f32fd4-1cb1-4197-92c9-25406a5ef55c",
    image: "assets/images/product_0.png",
    title: "Blusa Longa Massa",
    category: "Camisas",
    description: lipsum,
    price: 165,
    bgColor: const Color(0xFFFEFBF9),
  ),
  Product(
    id: "cdf5c1d0-a75e-44af-bb18-faaa05a7ee43",
    image: "assets/images/product_3.png",
    title: "Blusa Massa",
    category: "Camisetas",
    description: lipsum,
    price: 149,
    bgColor: const Color(0xFFEEEEED),
  ),
  Product(
    id: "86e03cd3-bf03-4003-8c37-1a3af279a358",
    image: "assets/images/product_2.png",
    title: "Blusa Com Manga Dobrada",
    category: "Camisas",
    description: lipsum,
    price: 180,
    bgColor: const Color(0xFFF8FEFB),
  ),
];
