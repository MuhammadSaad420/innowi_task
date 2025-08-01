import 'package:innowi_task/model/data/cart_item.dart';

abstract class ICartRepository {
  Future<void> addItem(CartItem item);
  Future<List<CartItem>> getItems();
  Future<void> removeItem(CartItem item);
  Future<void> updateItem(CartItem item);
  Future<void> clearItems();
}