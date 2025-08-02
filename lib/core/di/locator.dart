import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:innowi_task/core/services/api/api_service.dart';
import 'package:innowi_task/core/services/db/db_service.dart';
import 'package:innowi_task/model/repositories/cart/cart_repository.dart';
import 'package:innowi_task/model/repositories/cart/icart_repository.dart';
import 'package:innowi_task/model/repositories/product/iproduct_repository.dart';
import 'package:innowi_task/model/repositories/product/product_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  Dio dio = Dio(
    BaseOptions(
      headers: {
        "accept": "application/json",
      },
    ),
  );
  dio.interceptors.add(PrettyDioLogger());

  locator.registerSingleton<IProductRepository>(
    ProductRepository(ApiService(dio)),
  );
  locator.registerSingleton<ICartRepository>(
    CartRepository(DbService.instance),
  );
}
