import 'package:dio/dio.dart' hide Headers;
import 'package:innowi_task/model/data/product_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants/app_constants.dart';

part 'api_service.g.dart';

class Apis {
  static const String products = 'products';
}

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(Apis.products)
  Future<ProductResponse> fetchProdcuts();
}
