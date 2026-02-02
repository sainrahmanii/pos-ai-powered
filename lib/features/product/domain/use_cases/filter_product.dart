import 'package:pos_ai_powered/features/product/domain/entities/product.dart';
import 'package:pos_ai_powered/features/product/domain/repositories/product_repository.dart';

class FilterProductsUseCase {
  final ProductRepository repository;

  FilterProductsUseCase(this.repository);

  List<Product> execute({
    required List<Product> products,
    required String category,
    required String keyword,
  }) {
    final lowerKeyword = keyword.toLowerCase();

    print(
      products
          .where(
            (p) => p.name.toLowerCase().contains(lowerKeyword.toLowerCase()),
          )
          .map((e) => e.name)
          .toList(),
    );

    return products.where((product) {
      final matchCategory = category == 'ALL' || product.category == category;

      final matchKeyword =
          lowerKeyword.isEmpty ||
          product.name.toLowerCase().contains(lowerKeyword);

      return matchCategory && matchKeyword;
    }).toList();
  }
}
