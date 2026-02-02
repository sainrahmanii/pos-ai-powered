import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/features/product/data/data_sources/product_local_datasource.dart';
import 'package:pos_ai_powered/features/product/presentation/widgets/card_product_widget.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf8fafc),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstant.primary,
        foregroundColor: Colors.white,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Icon(Icons.add_rounded),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product List",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "${products.length} items in inventory",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Expanded(child: CardProduct()),
          ],
        ),
      ),
    );
  }
}
