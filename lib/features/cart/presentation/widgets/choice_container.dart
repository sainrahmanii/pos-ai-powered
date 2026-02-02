import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_ai_powered/utils/color_constant.dart';

class ChoiceContainer extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const ChoiceContainer({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? ColorConstant.primary : Colors.transparent;
    final textColor = selected ? Colors.white : Colors.black;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedScale(
          scale: 1.0,
          duration: const Duration(milliseconds: 180),
          curve: Curves.elasticOut,
          child: AnimatedContainer(
            alignment: Alignment.center,
            width: MediaQuery.sizeOf(context).width / 2.4,
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCirc,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(30),
            ),
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: GoogleFonts.plusJakartaSans(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              child: Text(label),
            ),
          ),
        ),
      ),
    );
  }
}
