import 'package:flutter/material.dart';
import 'package:la_nation/constants/divider.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class LesArticle extends StatelessWidget {
  final String text;
  final int num;
  final String permalink;

  const LesArticle(
      {super.key,
      required this.text,
      required this.num,
      required this.permalink});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetail(
                      permalink: permalink,
                    )));
      },
      child: SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            Row(
              children: [
                TextWidget(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.w500,
                  text: num.toString(),
                  textColor: app_color.black,
                ),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: TextWidget(
                    fontSize: screenWidth * 0.038,
                    fontWeight: FontWeight.w500,
                    text: text,
                    textColor: app_color.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            const MyDivider(),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
