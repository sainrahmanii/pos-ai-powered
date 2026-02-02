import 'package:pos_ai_powered/features/product/domain/entities/product.dart';

class CartProduct {
  final Product product;
  int numOfItem;
  CartProduct({required this.product, required this.numOfItem});
}
