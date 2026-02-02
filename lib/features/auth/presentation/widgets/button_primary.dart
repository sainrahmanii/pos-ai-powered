import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String textButton;
  final Color btnColor;
  final Color textBtnColor;
  final BorderRadiusGeometry cornerRadiusButton;
  final GestureTapCallback onPressed;
  const ButtonPrimary({
    super.key,
    required this.textButton,
    required this.btnColor,
    required this.textBtnColor,
    required this.cornerRadiusButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: cornerRadiusButton,
          color: btnColor,
        ),
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: 16,
            color: textBtnColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
