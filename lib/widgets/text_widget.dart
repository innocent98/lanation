import 'package:flutter/material.dart';
import '../constants/colors.dart' as app_color;

class TextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double? height;
  final TextAlign? align;

  const TextWidget(
      {required this.fontSize,
      required this.fontWeight,
      required this.text,
      this.textColor,
      this.height,
      this.align,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? app_color.white,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: 'IBM',
        height: height,
      ),
      textAlign: align,
    );
  }
}
