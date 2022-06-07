import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:arcanth_shop/components/auth_required_state.dart';
import 'package:arcanth_shop/const.dart';
import 'package:arcanth_shop/controllers/cart_controller.dart';
import 'package:arcanth_shop/models/order.dart';
import 'package:arcanth_shop/models/product.dart';
import 'package:arcanth_shop/screens/details/orders_screen.dart';
import 'package:arcanth_shop/components/home/body.dart';
import 'package:arcanth_shop/components/home/header.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends AuthRequiredState<HomeScreen> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: headerComponent(context),
      body: const HomeBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          List<Order> orders = [];
          // Get orders on DB
          var getManyOrders = await supabase
              .from('orders')
              .select()
              .eq('user_id', supabase.auth.currentUser?.id)
              .execute();

          for (dynamic order in getManyOrders.data) {
            var productsToJSON = json.decode(order['products']);
            orders.add(
              Order(
                id: order['id'],
                products: List.generate(
                  productsToJSON.length,
                  (index) => OrderProduct(
                    id: productsToJSON[index]['id'],
                    amount: productsToJSON[index]['amount'],
                    image: productsToJSON[index]['image'],
                    title: productsToJSON[index]['title'],
                    price: productsToJSON[index]['price'],
                    description: productsToJSON[index]['description'],
                    category: productsToJSON[index]['category'],
                  ),
                ),
              ),
            );
          }
          // Send to orders page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrdersScreen(
                orders: orders,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xFF121212),
      ),
    );
  }
}
