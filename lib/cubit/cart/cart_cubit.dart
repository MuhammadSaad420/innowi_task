import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/cubit/cart/cart_state.dart';
import 'package:innowi_task/model/data/cart_item.dart';
import 'package:innowi_task/model/repositories/cart/icart_repository.dart';

class CartCubit extends Cubit<CartState> {
  final ICartRepository _cartRepository;
  CartCubit(this._cartRepository) : super(CartState());

  Future<void> fetchCartItems() async {
    try {
      emit(state.copyWith(isLoading: true));
      final cartItems = await _cartRepository.getItems();
      emit(
        state.copyWith(
          items: cartItems,
          isLoading: false,
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> addItem(CartItem item) async {
    final cartItems = await _cartRepository.getItems();
    if (!cartItems.any((element) => element.productId == item.productId)) {
      await _cartRepository.addItem(item);
      fetchCartItems();
    }
  }

  Future<void> incrementItem(CartItem item) async {
    final cartItems = await _cartRepository.getItems();
    final existingItem =
        cartItems.firstWhere((element) => element.productId == item.productId);
    existingItem.quantity += 1;
    await _cartRepository.updateItem(existingItem);
    fetchCartItems();
  }

  Future<void> decrementItem(CartItem item) async {
    final cartItems = await _cartRepository.getItems();
    final existingItem =
        cartItems.firstWhere((element) => element.productId == item.productId);
    existingItem.quantity -= 1;
    if (existingItem.quantity == 0) {
      await _cartRepository.removeItem(item);
    } else {
      await _cartRepository.updateItem(existingItem);
    }
    fetchCartItems();
  }

  Future<void> clearCartItems() async {
    try {
      emit(state.copyWith(isLoading: true));
      await _cartRepository.clearItems();
      emit(
        state.copyWith(
          items: [],
          isLoading: false,
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
