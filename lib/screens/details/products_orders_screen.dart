import 'package:arcanth_shop/models/product.dart';
import 'package:arcanth_shop/screens/cart/cart_product_card.dart';
import 'package:flutter/material.dart';

class ProductsOrdersScreen extends StatelessWidget {
  const ProductsOrdersScreen({Key? key, required this.products})
      : super(key: key);
  final List<OrderProduct> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          "Produtos",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: double.maxFinite,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartProductCard(
                    product: products[index],
                    amount: products[index].amount,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
