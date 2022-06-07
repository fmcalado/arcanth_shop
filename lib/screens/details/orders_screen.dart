import 'package:arcanth_shop/const.dart';
import 'package:arcanth_shop/models/order.dart';
import 'package:arcanth_shop/screens/details/products_orders_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key, required this.orders}) : super(key: key);

  final List<Order> orders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
      ),
      body: orders.isNotEmpty
          ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  orders.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(
                          defaultPadding,
                          defaultPadding * 2,
                          defaultPadding,
                          defaultPadding,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(defaultBorderRadius * 3),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Pedido:",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              orders[index].id,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsOrdersScreen(
                              products: orders[index].products,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                left: defaultPadding,
                top: defaultPadding,
              ),
              child: Text(
                "Você ainda não fez nenhum pedido",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
    );
  }
}
