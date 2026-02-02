import 'package:flutter/material.dart';
import 'package:pos_ai_powered/features/home/widgets/product_card_widget.dart';
import 'package:pos_ai_powered/features/product/domain/entities/product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> product;
  final int Function(int) getQty;
  final void Function(int) onAdd;
  final void Function(int) onRemove;

  const ProductGrid({
    super.key,
    required this.product,
    required this.getQty,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: ValueKey(product.map((e) => e.id).join()),
      padding: EdgeInsets.only(bottom: 100),
      itemCount: product.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (_, index) {
        final item = product[index];
        return ProductCardWidget(
          product: item,
          qty: getQty(item.id),
          onAdd: () => onAdd(item.id),
          onRemove: () => onRemove(item.id),
        );
      },
    );
  }
}
