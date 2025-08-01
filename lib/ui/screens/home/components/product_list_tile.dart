import 'package:flutter/material.dart';
import 'package:innowi_task/core/services/db/db_service.dart';
import 'package:innowi_task/model/data/cart_item.dart';

import '../../../../core/enums/image_type.dart';
import '../../../../model/data/product_model.dart';
import '../../../common/image_widget.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageWidget(
              imageSrc: product.images.first,
              type: ImageType.network,
              cache: true,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black54,
                  Colors.black12,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: mq.width * 0.5,
                            child: Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            "\$ ${product.price.toString()}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // DbService.instance.getCartItems().then((items) {
                          //   print(items.toString());
                          // });
                          // // DbService.instance.clearCart();
                          // // DbService.instance.addCartItem(
                          // //   CartItem()
                          // //     ..productName = product.title
                          // //     ..productImage = product.images.first
                          // //     ..productPrice = product.price
                          // //     ..productId = product.id
                          // //     ..quantity = 1,
                          // // );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            AppStrings.add,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
