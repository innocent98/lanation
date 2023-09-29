import 'package:flutter/material.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../constants/colors.dart' as app_color;

class SideBarWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onPressed;
  final IconData? icon2;
  final String? text2;
  final Function()? onPressed2;
  final IconData? icon3;

  const SideBarWidget(
      {required this.icon,
      required this.text,
      this.onPressed,
      this.icon2,
      this.text2,
      this.onPressed2,
      this.icon3,
      super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(left: screenWidth * 0.08),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: app_color.black,
                  size: screenWidth * 0.04,
                ),
                SizedBox(width: screenWidth * 0.03),
                TextWidget(
                  fontSize: screenWidth * 0.034,
                  fontWeight: FontWeight.w400,
                  text: text,
                  textColor: app_color.black,
                ),
                SizedBox(width: icon3 != null ? screenWidth * 0.3 : 0),
                GestureDetector(
                  onTap: onPressed,
                  child: Icon(
                    icon3,
                    color: app_color.black,
                    size: screenWidth * 0.1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          GestureDetector(
            onTap: onPressed2,
            child: Row(
              children: [
                Icon(
                  icon2,
                  color: app_color.black,
                  size: screenWidth * 0.04,
                ),
                SizedBox(width: screenWidth * 0.03),
                TextWidget(
                  fontSize: screenWidth * 0.034,
                  fontWeight: FontWeight.w400,
                  text: text2 ?? '',
                  textColor: app_color.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
