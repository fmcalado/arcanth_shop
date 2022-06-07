import 'dart:convert';

import 'package:arcanth_shop/const.dart';
import 'package:arcanth_shop/controllers/cart_controller.dart';
import 'package:arcanth_shop/screens/cart/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  CartScreen({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
            onPressed: () {
              cartController.deleteAll();
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: cartController.products.length > 0
          ? Column(
              children: [
                SizedBox(
                  height: 600,
                  child: ListView.builder(
                    itemCount: cartController.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartProductCard(
                        product: cartController.products.keys.toList()[index],
                        amount: cartController.products.values.toList()[index],
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: defaultPadding),
                    Text(
                      "Total: R\$${getTotal(cartController.products)}",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        List<dynamic> order = [];

                        cartController.products.forEach((key, value) {
                          var toDb = {
                            "id": key.id,
                            "image": key.image,
                            "title": key.title,
                            "category": key.category,
                            "description": key.description,
                            "price": key.price,
                            "amount": value
                          };
                          order.add(toDb);
                        });

                        final jsonOrder = json.encode(order);
                        supabase.from("orders").insert([
                          {
                            'user_id': supabase.auth.currentUser?.id,
                            'products': jsonOrder,
                          }
                        ]).execute();

                        Navigator.pop(context);
                        Get.snackbar(
                          "Sucesso",
                          "sua compra foi concluída com sucesso",
                          duration: const Duration(seconds: 1)
                        );
                        cartController.deleteAll();
                      },
                      child: const Text("Finalizar compra"),
                    ),
                  ],
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                top: defaultPadding,
              ),
              child: Text(
                "Nenhum produto no carrinho",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
    );
  }
}

num getTotal(RxMap<dynamic, dynamic> products) {
  num total = 0;
  products.forEach((key, value) {
    total += key.price * value;
  });
  return total;
}
