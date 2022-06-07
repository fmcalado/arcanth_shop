import 'package:arcanth_shop/models/product.dart';

class Order {
  final String id;
  final List<OrderProduct> products;

  Order({required this.id, required this.products});
}