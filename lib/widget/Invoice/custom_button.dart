import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color? color;
  final Color? borderColor;
  final TextStyle textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.color,
    this.borderColor,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderColor != null ? 5 : 8),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1)
            : null,
      ),
      child: Center(child: Text(text, style: textStyle)),
    );
  }
}
