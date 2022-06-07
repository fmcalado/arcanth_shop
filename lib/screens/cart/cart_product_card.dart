import 'package:arcanth_shop/components/home/product_card.dart';
import 'package:arcanth_shop/models/product.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int amount;

  const CartProductCard({
    Key? key,
    required this.product,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductCard(
      productImage: product.image,
      productTitle: "${product.title} x $amount",
      bgColor: product.bgColor,
      productPrice: product.price * amount,
      press: () {},
    );
  }
}
