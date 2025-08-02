import 'package:flutter/material.dart';

import '../../../../core/enums/image_type.dart';
import '../../../../model/data/product_model.dart';
import '../../../common/image_widget.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';

class GridProductListTile extends StatelessWidget {
  const GridProductListTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
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
                              width: constraints.maxWidth * 0.5,
                              child: Text(
                                product.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              "\$ ${product.price.toString()}",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            AppStrings.addToCart,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
