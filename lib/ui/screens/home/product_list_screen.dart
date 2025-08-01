import 'package:flutter/material.dart';

import '../../common/app_bar_widget.dart';
import 'components/landscape_listing_view.dart';
import 'components/portrait_listing_view.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: OrientationBuilder(builder: (_, orientation) {
        return orientation == Orientation.portrait
            ? const PortraitListingView()
            : const LandscapeListingView();
      }),
    );
  }
}
