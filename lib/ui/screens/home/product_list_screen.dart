import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:innowi_task/cubit/product_cubit.dart';

import '../../../cubit/product_state.dart';
import '../../common/app_bar_widget.dart';
import 'components/landscape_listing_view.dart';
import 'components/portrait_listing_view.dart';

class ProductListScreen extends HookWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productCubit = context.read<ProductCubit>();
    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        productCubit.fetchProducts();
      });
      return null;
    }, []);
    return Scaffold(
      appBar: const AppBarWidget(),
      body: BlocBuilder<ProductCubit, ProductState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.error != null) {
          return Center(child: Text(state.error!));
        }
        return OrientationBuilder(builder: (_, orientation) {
          return orientation == Orientation.portrait
              ? PortraitListingView(products: state.products)
              : LandscapeListingView(products: state.products);
        });
      }),
    );
  }
}
