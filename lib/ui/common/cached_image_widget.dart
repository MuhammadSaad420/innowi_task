import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    super.key,
    required this.imgUrl,
    this.imageHeight,
    this.imageWidth,
  });
  final String imgUrl;
  final double? imageHeight;
  final double? imageWidth;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      height: imageHeight,
      width: imageWidth,
      fit: BoxFit.fill,
      errorWidget: (_, __, ___) => Container(),
    );
  }
}
