import 'package:flutter/material.dart';
import 'package:pos_ai_powered/features/home/products_page_pos.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ProductPagePos(),
    );
  }
}
