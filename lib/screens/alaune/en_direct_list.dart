import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class EnDirectList extends StatelessWidget {
  final String image;
  final String text;
  final int duration;
  final String date;
  final int view;
  final String permalink;

  const EnDirectList(
      {required this.image,
      required this.duration,
      required this.text,
      required this.date,
      required this.view,
      required this.permalink,
      super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    DateTime dateFormat = DateTime.parse(date);

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetail(
                      permalink: permalink,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              height: screenHeight * 0.2,
              width: screenWidth,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: TextWidget(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      text: text,
                      textColor: app_color.black,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: app_color.lightTextSoft,
                          size: screenWidth * 0.03,
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        TextWidget(
                          fontSize: screenWidth * 0.025,
                          fontWeight: FontWeight.w600,
                          text: view.toString(),
                          textColor: app_color.lightTextSoft,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w400,
                  text:
                      'Le ${DateFormat('dd MMMM, yyyy', 'fr').format(dateFormat)}',
                  textColor: app_color.lightTextSoft,
                ),
                TextWidget(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w400,
                  text: '$duration min de lecture',
                  textColor: app_color.lightTextSoft,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
