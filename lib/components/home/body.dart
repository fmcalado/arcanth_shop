import 'package:arcanth_shop/components/home/category_card.dart';
import 'package:arcanth_shop/components/home/product_card.dart';
import 'package:arcanth_shop/components/home/product_section.dart';
import 'package:arcanth_shop/components/home/search_form.dart';
import 'package:arcanth_shop/models/category.dart';
import 'package:arcanth_shop/models/product.dart';
import 'package:arcanth_shop/screens/details/categories_screen.dart';
import 'package:arcanth_shop/screens/details/details_screen.dart';
import 'package:arcanth_shop/screens/details/products_screen.dart';
import 'package:flutter/material.dart';

import 'package:arcanth_shop/const.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> forYouProducts = dummyProducts;
    forYouProducts.shuffle();
    newProducts.shuffle();

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A Loja Ideal",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "para suas compras",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  dummyCategories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: defaultPadding),
                    child: CategoryCard(
                      iconURI: dummyCategories[index].icon,
                      categoryTitle: dummyCategories[index].title,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(
                                category: dummyCategories[index].title),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            ProductSection(
              sectionTitle: "Pra você",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductsScreen(),
                  ),
                );
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  forYouProducts.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: defaultPadding),
                    child: ProductCard(
                      productTitle: forYouProducts[index].title,
                      productPrice: forYouProducts[index].price,
                      productImage: forYouProducts[index].image,
                      bgColor: forYouProducts[index].bgColor,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: forYouProducts[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            ProductSection(
              sectionTitle: "Novidades",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductsScreen(),
                  ),
                );
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  newProducts.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: defaultPadding),
                    child: ProductCard(
                      productTitle: newProducts[index].title,
                      productPrice: newProducts[index].price,
                      productImage: newProducts[index].image,
                      bgColor: newProducts[index].bgColor,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: newProducts[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * 2.5),
          ],
        ),
      ),
    );
  }
}
