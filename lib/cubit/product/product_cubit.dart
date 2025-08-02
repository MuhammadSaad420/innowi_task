import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/cubit/product/product_state.dart';
import 'package:innowi_task/model/repositories/product/iproduct_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  final IProductRepository _productRepository;
  ProductCubit(this._productRepository) : super(ProductState());

  Future<void> fetchProducts() async {
    try {
      emit(state.copyWith(isLoading: true));
      final productResponse = await _productRepository.fetchProducts();
      emit(
        state.copyWith(
          products: productResponse.products,
          isLoading: false,
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
