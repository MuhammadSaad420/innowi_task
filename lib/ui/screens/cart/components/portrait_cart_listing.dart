import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:innowi_task/core/enums/image_type.dart';
import 'package:innowi_task/cubit/cart/cart_cubit.dart';
import 'package:innowi_task/ui/common/image_widget.dart';

import '../../../../model/data/cart_item.dart';
import '../../../common/rounded_icon_button.dart';

class PortraitCartListing extends StatelessWidget {
  const PortraitCartListing({
    super.key,
    required this.cartItems,
  });

  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ImageWidget(
                  imageSrc: cartItems[index].productImage ?? '',
                  type: ImageType.network,
                  imgWidth: 60,
                  imgHeight: 60,
                  cache: true,
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItems[index].productName ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      "\$ ${cartItems[index].productPrice.toString()}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  RoundIconButton(
                    icon: Icons.remove,
                    onTap: () => context
                        .read<CartCubit>()
                        .decrementItem(cartItems[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
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
          ),
        );
      },
    );
  }
}

