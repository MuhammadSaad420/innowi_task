import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:innowi_task/cubit/cart/cart_cubit.dart';
import 'package:innowi_task/cubit/product/product_cubit.dart';
import 'package:innowi_task/ui/resources/app_routes.dart';
import 'package:innowi_task/ui/resources/app_strings.dart';

import '../../../cubit/cart/cart_state.dart';
import '../../../cubit/product/product_state.dart';
import '../../common/app_bar_widget.dart';
import 'components/landscape_listing_view.dart';
import 'components/portrait_listing_view.dart';

class ProductListScreen extends HookWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    final cartCubit = context.read<CartCubit>();
    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Future.wait([
          productCubit.fetchProducts(),
          cartCubit.fetchCartItems(),
        ]);
      });
      return null;
    }, []);
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.products,
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.pushNamed(AppRoutes.cartScreen);
                },
                child: Badge(
                  label: Text(state.items.length.toString()),
                  child: const Icon(Icons.shopping_cart),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text(state.error!));
          }
          return OrientationBuilder(
            builder: (_, orientation) {
              return orientation == Orientation.portrait
                  ? PortraitListingView(products: state.products)
                  : LandscapeListingView(products: state.products);
            },
          );
        },
      ),
    );
  }
}
