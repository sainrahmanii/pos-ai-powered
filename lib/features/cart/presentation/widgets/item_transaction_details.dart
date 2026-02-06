// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTransactionDetails extends StatelessWidget {
  final String label;
  final int qty;
  final double totalPrice;
  const ItemTransactionDetails({
    super.key,
    required this.label,
    required this.qty,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$qty     $label", style: GoogleFonts.plusJakartaSans()),
        Text(
          "${totalPrice.toInt()}",
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
