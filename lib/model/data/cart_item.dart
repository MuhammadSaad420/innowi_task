import 'package:objectbox/objectbox.dart';

@Entity()
class CartItem {
  @Id()
  int id = 0;
  int quantity = 0;
  int? productId;
  String? productName;
  String? productImage;
  double? productPrice;

  @override
  String toString() {
    return 'CartItem(id: $id, quantity: $quantity, productId: $productId, productName: $productName, productImage: $productImage, productPrice: $productPrice)';
  }
}
