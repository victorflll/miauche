import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final bool isBold;
  final double? letterSpacing;
  final TextAlign align;

  const AppText({
    Key? key,
    required this.label,
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontFamily = "Poppins",
    this.isBold = false,
    this.letterSpacing,
    this.align = TextAlign.center,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: align,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
