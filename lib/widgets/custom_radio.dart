import 'package:flutter/material.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../constants/colors.dart' as app_color;

class MyRadio extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onPressed;

  const MyRadio(
      {required this.text,
      required this.color,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: app_color.lightTextSoft),
              borderRadius: BorderRadius.circular(50)),
          child: Icon(
            Icons.circle,
            size: screenWidth * 0.04,
            color: color,
          ),
        ),
        title: TextWidget(
          fontSize: screenWidth * 0.035,
          fontWeight: FontWeight.w500,
          text: text,
          textColor: app_color.black,
        ),
      ),
    );
  }
}
