import 'package:arcanth_shop/components/details/add_product.dart';
import 'package:arcanth_shop/const.dart';
import 'package:arcanth_shop/models/product.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          Image.asset(
            product.image,
            height: MediaQuery.of(context).size.height * .4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                defaultPadding,
                defaultPadding * 2,
                defaultPadding,
                defaultPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultBorderRadius * 3),
                  topRight: Radius.circular(defaultBorderRadius * 3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: AddProduct(product: product),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            Text(
              "R\$${product.price}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(product.description),
        ),
        const SizedBox(height: defaultPadding),
        AddProduct(product: product),
      ],
    );
  }
}
