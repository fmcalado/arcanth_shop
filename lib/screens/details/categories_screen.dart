import 'package:arcanth_shop/components/home/product_card.dart';
import 'package:arcanth_shop/const.dart';
import 'package:arcanth_shop/models/product.dart';
import 'package:arcanth_shop/screens/details/details_screen.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    var camisas =
        newProducts.where((product) => product.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: camisas.isNotEmpty
          ? GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                camisas.length,
                (index) => ProductCard(
                  productImage: camisas[index].image,
                  productTitle: camisas[index].title,
                  bgColor: camisas[index].bgColor,
                  productPrice: camisas[index].price,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(product: camisas[index]),
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
