import 'package:flutter/material.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class AlauneMain extends StatelessWidget {
  final String image;
  final String text;
  final String permalink;

  const AlauneMain(
      {required this.image,
      required this.text,
      required this.permalink,
      super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetail(
                      permalink: permalink,
                    )));
      },
      child: Column(
        children: [
          Image.network(
            image,
            height: screenHeight * 0.3,
            width: screenWidth,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(color: app_color.darkBackground),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.035),
              child: Row(
                children: [
                  SizedBox(
                      width: screenWidth * 0.85,
                      child: TextWidget(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                          text: text,
                          overflow: TextOverflow.ellipsis,
                          maxLine: 2)),
                  const Icon(
                    Icons.bookmark_border,
                    color: app_color.lightBackground,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          )
        ],
      ),
    );
  }
}
