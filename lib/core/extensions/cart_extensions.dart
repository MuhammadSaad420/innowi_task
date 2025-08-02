import 'package:innowi_task/model/data/cart_item.dart';

extension CartExtensions on List<CartItem> {
  double get totalPrice => fold<double>(0, (sum, item) => sum + (item.productPrice! * item.quantity));
}