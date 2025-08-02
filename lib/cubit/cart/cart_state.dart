import 'package:innowi_task/model/data/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final bool isLoading;
  final String error;

  CartState({
    this.items = const [],
    this.isLoading = false,
    this.error = '',
  });

  CartState copyWith({
    List<CartItem>? items,
    bool? isLoading,
    String? error,
  }) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}