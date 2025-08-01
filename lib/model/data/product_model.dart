import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  factory ProductResponse({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@freezed
class Product with _$Product {
  factory Product({
    required int id,
    required String title,
    required String description,
    required double price,
    required List<String> images,
    required String thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
