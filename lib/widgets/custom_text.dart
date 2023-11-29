import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  TextStyle? style;
  TextAlign? textAlign;
  TextOverflow? overflow;
  int? maxLines;

  CustomText({
    required this.text,
    this.style,
    this.overflow,
    this.maxLines,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
