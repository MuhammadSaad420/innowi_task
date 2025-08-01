import 'package:flutter/material.dart';
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
      itemBuilder: (_, index) => ProductListTile(product: products[index]),
    );
  }
}
