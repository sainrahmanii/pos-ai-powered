import 'package:flutter/material.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

final List<String> categories = ['ALL', 'Drink', 'Food', 'Snack', 'Other'];

class CategoryTabs extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onTap;

  const CategoryTabs({super.key, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final active = category == selected;
          return GestureDetector(
            onTap: () => onTap(category),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: active ? ColorConstant.primary : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: active
                    ? Border.all(style: BorderStyle.none)
                    : Border.all(color: Colors.grey),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: active ? Colors.white : Colors.black,
                  fontWeight: active ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
