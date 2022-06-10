import 'package:arcanth_shop/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final _products = {}.obs;

  void addProduct(Product product, int amount) {
    if (_products.containsKey(product)) {
      _products[product] += amount;
    } else {
      _products[product] = amount;
    }
    Get.snackbar(
      product.title,
      "adicionado ao carrinho",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1)
    );
  }
  void deleteAll() {
    _products.clear();
    Get.snackbar(
      "Carrinho",
      "o carrinho foi esvaziado",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1)
    );
  }

  get products => _products;
}
