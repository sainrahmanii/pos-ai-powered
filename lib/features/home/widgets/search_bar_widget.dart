import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search product...",
          hintStyle: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(width: 2, color: ColorConstant.primary),
          ),
          prefixIcon: Icon(CupertinoIcons.search, color: Colors.grey[700]),
        ),
      ),
    );
  }
}
