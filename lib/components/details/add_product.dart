import 'package:arcanth_shop/const.dart';
import 'package:arcanth_shop/controllers/cart_controller.dart';
import 'package:arcanth_shop/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final cartController = Get.put(CartController());
  int _productCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.product.title,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            Text(
              "R\$${widget.product.price * _productCounter}",
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(widget.product.description),
        ),
        const SizedBox(height: defaultPadding),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_productCounter >= 2) _productCounter--;
                    });
                  },
                  child: const Text("-"),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: defaultPadding, right: defaultPadding),
                  child: Text(
                    "$_productCounter",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _productCounter++;
                    });
                  },
                  child: const Text("+"),
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            SizedBox(
              width: 200,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  cartController.addProduct(widget.product, _productCounter);
                  Navigator.pop(context);
                },
                child: const Text("Adicionar ao carrinho"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
