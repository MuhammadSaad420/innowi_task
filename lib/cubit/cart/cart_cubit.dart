import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/cubit/cart/cart_state.dart';
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
}
