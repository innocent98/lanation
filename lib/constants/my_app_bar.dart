import 'package:flutter/material.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../constants/colors.dart' as app_color;

class MyAppBar {
  static AppBar build(BuildContext context, String text) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: app_color.white,
      foregroundColor: app_color.white,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: app_color.black,
          size: screenWidth * 0.07,
        ),
      ),
      title: TextWidget(
        fontSize: screenWidth * 0.05,
        fontWeight: FontWeight.w500,
        text: text,
        textColor: app_color.black,
      ),
    );
  }
}
