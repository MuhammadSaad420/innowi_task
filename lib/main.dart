import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/core/di/locator.dart';
import 'package:innowi_task/cubit/product_cubit.dart';
import 'package:innowi_task/model/repositories/iproduct_repository.dart';
import 'package:innowi_task/ui/resources/app_routes.dart';
import 'package:innowi_task/ui/resources/app_theme.dart';

Future<void> main() async {
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
            create: (context) => ProductCubit(locator<IProductRepository>())),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
