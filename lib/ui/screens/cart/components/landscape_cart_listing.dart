import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:innowi_task/cubit/cart/cart_cubit.dart';

import '../../../../core/enums/image_type.dart';
import '../../../../model/data/cart_item.dart';
import '../../../common/image_widget.dart';
import '../../../common/rounded_icon_button.dart';

class LandscapeCartListing extends StatelessWidget {
  const LandscapeCartListing({
    super.key,
    required this.cartItems,
  });

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.8,
      ),
      itemCount: cartItems.length,
      itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(100),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (_, constraints) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: ImageWidget(
                      imageSrc: cartItems[index].productImage ?? '',
                      type: ImageType.network,
                      imgWidth: constraints.maxWidth * 0.7,
                      imgHeight: constraints.maxHeight * 0.4,
                      cache: true,
                    ),
                  ),
                  const Gap(12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItems[index].productName ?? '',
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.08,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(4.0),
                        Text(
                          "\$ ${cartItems[index].productPrice.toString()}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: Icons.remove,
                        onTap: () => context
                            .read<CartCubit>()
                            .decrementItem(cartItems[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          cartItems[index].quantity.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      RoundIconButton(
                        icon: Icons.add,
                        onTap: () => context
                            .read<CartCubit>()
                            .incrementItem(cartItems[index]),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
