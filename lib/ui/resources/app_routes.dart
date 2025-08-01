import 'package:go_router/go_router.dart';
import 'package:innowi_task/ui/screens/home/product_list_screen.dart';

class AppRoutes {
  AppRoutes._();

  //Route Names
  static const String homeScreen = 'home_screen';

  //Route paths
  static const String homePath = '/';
}

final router = GoRouter(
  initialLocation: AppRoutes.homePath,
  routes: [
    GoRoute(
      name: AppRoutes.homeScreen,
      path: AppRoutes.homePath,
      builder: (_, state) => const ProductListScreen(),
    ),
  ],
);
