import 'package:innowi_task/model/data/product_model.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;
  final String? error;

  ProductState({
    this.products = const [],
    this.isLoading = false,
    this.error,
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
