import 'package:go_router/go_router.dart';
import 'package:innowi_task/ui/screens/cart/cart_screen.dart';
import 'package:innowi_task/ui/screens/product/product_list_screen.dart';

class AppRoutes {
  AppRoutes._();

  //Route Names
  static const String homeScreen = 'home_screen';
  static const String cartScreen = 'cart_screen';

  //Route paths
  static const String homePath = '/';
  static const String cartPath = '/cart';
}

final router = GoRouter(
  initialLocation: AppRoutes.homePath,
  routes: [
    GoRoute(
      name: AppRoutes.homeScreen,
      path: AppRoutes.homePath,
      builder: (_, state) => const ProductListScreen(),
    ),
    GoRoute(
      name: AppRoutes.cartScreen,
      path: AppRoutes.cartPath,
      builder: (_, state) => const CartScreen(),
    ),
  ],
);
