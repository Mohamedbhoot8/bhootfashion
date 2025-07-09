import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.size = 16,
      this.weight = FontWeight.normal,
      this.color = Colors.white,
      this.max = 1,
      this.height = 1.0,
      this.spacing = 1,
      this.textDirection = TextDirection.ltr,
      this.fontfamily = 'Tenorsans',
      this.overflow = TextOverflow.ellipsis});

  final String text, fontfamily;
  final double size;
  final FontWeight weight;
  final Color color;
  final int max;
  final double height;
  final double spacing;
  final TextDirection textDirection;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      textDirection: textDirection,
      style: TextStyle(
        fontFamily: fontfamily,
        letterSpacing: spacing,
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: height,
        overflow: overflow,
      ),
    );
  }
}
