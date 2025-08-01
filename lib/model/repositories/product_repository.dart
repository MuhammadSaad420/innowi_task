import 'package:innowi_task/core/services/api/api_service.dart';
import 'package:innowi_task/model/data/product_model.dart';
import 'package:innowi_task/model/repositories/iproduct_repository.dart';

class ProductRepository implements IProductRepository {
  final ApiService _apiService;

  ProductRepository(this._apiService);

  @override
  Future<ProductResponse> fetchProducts() async {
    final response = await _apiService.fetchProdcuts();
    return response;
  }
}