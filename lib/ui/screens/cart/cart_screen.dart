import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/core/extensions/cart_extensions.dart';
import 'package:innowi_task/cubit/cart/cart_cubit.dart';
import 'package:innowi_task/ui/common/app_bar_widget.dart';
import 'package:innowi_task/ui/resources/app_strings.dart';
import 'package:innowi_task/ui/screens/cart/components/cart_footer.dart';

import 'components/landscape_cart_listing.dart';
import 'components/portrait_cart_listing.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state.items;
    return Scaffold(
      appBar: const AppBarWidget(
        title: AppStrings.cart,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(AppStrings.noItemsInCart),
            )
          : OrientationBuilder(
              builder: (_, orientation) {
                return orientation == Orientation.portrait
                    ? PortraitCartListing(cartItems: cartItems)
                    : LandscapeCartListing(cartItems: cartItems);
              },
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : CartFooter(
              totalPrice: cartItems.totalPrice.toStringAsFixed(2),
            ),
    );
  }
}
