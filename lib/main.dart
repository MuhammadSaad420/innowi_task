import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/core/di/locator.dart';
import 'package:innowi_task/core/services/db/db_service.dart';
import 'package:innowi_task/cubit/cart/cart_cubit.dart';
import 'package:innowi_task/cubit/product/product_cubit.dart';
import 'package:innowi_task/model/repositories/cart/icart_repository.dart';
import 'package:innowi_task/model/repositories/product/iproduct_repository.dart';
import 'package:innowi_task/ui/resources/app_routes.dart';
import 'package:innowi_task/ui/resources/app_theme.dart';

late DbService dbService;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dbService = await DbService.create();
  await setupLocator();
  runApp(const InnowiTask());
}

class InnowiTask extends StatelessWidget {
  const InnowiTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(
            locator<IProductRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => CartCubit(
            locator<ICartRepository>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
