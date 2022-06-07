import 'package:arcanth_shop/components/home/product_card.dart';
import 'package:arcanth_shop/const.dart';
import 'package:arcanth_shop/models/product.dart';
import 'package:arcanth_shop/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

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
      body: dummyProducts.isNotEmpty
          ? GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                dummyProducts.length,
                (index) => ProductCard(
                  productImage: dummyProducts[index].image,
                  productTitle: dummyProducts[index].title,
                  bgColor: dummyProducts[index].bgColor,
                  productPrice: dummyProducts[index].price,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(product: dummyProducts[index]),
                      ),
                    );
                  },
                ),
              ),
            )
          : Padding(
            padding: const EdgeInsets.only(left: defaultPadding, top: defaultPadding),
            child: Text(
                "Nenhum produto encontrado",
                style: Theme.of(context).textTheme.headline4,
              ),
          ),
    );
  }
}
