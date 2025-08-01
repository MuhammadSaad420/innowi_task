import 'package:flutter/material.dart';
import 'package:innowi_task/ui/screens/home/components/grid_list_tile.dart';

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
      itemBuilder: (_, index) => GridListTile(product: products[index]),
    );
  }
}
