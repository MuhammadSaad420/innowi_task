import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innowi_task/cubit/cart/cart_cubit.dart';
import 'package:innowi_task/model/data/cart_item.dart';
import 'package:innowi_task/model/data/product_model.dart';
import 'package:innowi_task/ui/screens/home/components/product_list_tile.dart';

class PortraitListingView extends StatelessWidget {
  const PortraitListingView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) => ProductListTile(
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
