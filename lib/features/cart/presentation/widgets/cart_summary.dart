import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/features/cart/models/cart_product.dart';
import 'package:pos_ai_powered/features/cart/presentation/pages/cart_page.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class CartSummary extends StatelessWidget {
  final num totalItems;
  final Map<int, CartProduct> cart;
  final VoidCallback? onTap;
  const CartSummary({
    super.key,
    required this.totalItems,
    required this.cart,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CartPage(cartItems: cart)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ColorConstant.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.shopping_basket_rounded, color: Colors.white),
            ),
            Text(
              '$totalItems items selected',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
