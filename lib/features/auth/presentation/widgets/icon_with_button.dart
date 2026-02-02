import 'package:flutter/material.dart';

class IconWithButton extends StatelessWidget {
  final String textButton;
  final String assetIconButton;
  const IconWithButton({
    super.key,
    required this.textButton,
    required this.assetIconButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE8E8E8), width: 1),
          borderRadius: BorderRadius.circular(56),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [Image.asset(assetIconButton), Text(textButton)],
        ),
      ),
    );
  }
}
