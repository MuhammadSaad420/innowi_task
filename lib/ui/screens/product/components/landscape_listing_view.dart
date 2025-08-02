import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/ui/screens/product/components/grid_product_list_tile.dart';

import '../../../../cubit/cart/cart_cubit.dart';
import '../../../../model/data/cart_item.dart';
import '../../../../model/data/product_model.dart';

class LandscapeListingView extends StatelessWidget {
  const LandscapeListingView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: products.length,
      itemBuilder: (_, index) => GridProductListTile(
        product: products[index],
        onAddToCart: () {
          final cartItem = CartItem()
            ..productName = products[index].title
            ..productImage = products[index].images.first
            ..productPrice = products[index].price
            ..productId = products[index].id
            ..quantity = 1;
          context.read<CartCubit>().addItem(cartItem);
        },
      ),
    );
  }
}
