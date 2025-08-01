import 'package:innowi_task/model/data/product_model.dart';

abstract class IProductRepository {
  Future<ProductResponse> fetchProducts();
}