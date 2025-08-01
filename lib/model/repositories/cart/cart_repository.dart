import 'package:innowi_task/core/services/db/db_service.dart';
import 'package:innowi_task/model/data/cart_item.dart';
import 'package:innowi_task/model/repositories/cart/icart_repository.dart';

class CartRepository extends ICartRepository {
  final DbService _dbService;
  CartRepository(this._dbService);

  @override
  Future<void> addItem(CartItem item) async {
    await _dbService.addItem(item);
  }

  @override
  Future<void> clearItems() async {
    await _dbService.clearItems<CartItem>();
  }

  @override
  Future<List<CartItem>> getItems() {
    return _dbService.getItems<CartItem>();
  }

  @override
  Future<void> removeItem(CartItem item) async {
    await _dbService.removeItem(item, item.id);
  }

  @override
  Future<void> updateItem(CartItem item) async {
    await _dbService.updateItem(item);
  }
}
