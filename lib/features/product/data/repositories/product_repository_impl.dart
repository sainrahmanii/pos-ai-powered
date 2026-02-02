import 'package:pos_ai_powered/features/product/data/data_sources/product_local_datasource.dart';
import 'package:pos_ai_powered/features/product/domain/entities/product.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  const ProductRepositoryImpl();

  Future<T> _run<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw e;
    }
  }

  @override
  List<Product> getAllProducts() {
    return products;
  }
}
