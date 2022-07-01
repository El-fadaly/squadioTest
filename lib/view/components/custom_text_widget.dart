import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final bool line;
  final bool isOffer;
  final bool isTextAlignCenter;
  final int? maxLines;
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 13,
    this.fontWeight = FontWeight.bold,
    this.line = false,
    this.isOffer = false,
    this.isTextAlignCenter = false,
    this.maxLines,
    this.fontColor = Colors.grey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.0,
      maxLines: isOffer ? null : (maxLines ?? 2),
      style: TextStyle(
        decoration: line ? TextDecoration.lineThrough : null,
        color: fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: 'Cairo',
      ),
    );
  }
}
