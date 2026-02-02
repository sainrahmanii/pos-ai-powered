import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/features/product/domain/entities/product.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final int qty;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const ProductCardWidget({
    super.key,
    required this.product,
    required this.qty,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          const SizedBox(height: 8),
          _title(),
          const SizedBox(height: 8),
          _footer(),
        ],
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Image.network(
        product.image,
        height: 140,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _title() {
    return Text(
      product.name,
      style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
    );
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Rp ${product.price}",
          style: GoogleFonts.plusJakartaSans(
            color: ColorConstant.primary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        qty == 0 ? _plusButton() : _quantityButton(),
      ],
    );
  }

  Widget _plusButton() {
    return InkWell(
      onTap: onAdd,
      child: Container(
        width: 30,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: ColorConstant.primary.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.add, size: 16, color: ColorConstant.primary),
      ),
    );
  }

  Widget _quantityButton() {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: ColorConstant.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _iconButton(Icons.remove, onRemove),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              qty.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          _iconButton(Icons.add, onAdd),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 22,
        height: 22,
        child: Icon(icon, size: 16, color: ColorConstant.primary),
      ),
    );
  }
}
