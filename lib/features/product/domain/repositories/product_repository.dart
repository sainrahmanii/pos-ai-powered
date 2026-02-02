import 'package:pos_ai_powered/features/product/domain/entities/product.dart';

abstract interface class ProductRepository {
  @override
  List<Product> getAllProducts();
}
