import 'package:flutter/material.dart';
import 'package:la_nation/constants/divider.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class AlauneExtra extends StatelessWidget {
  final String image;
  final String text;
  final String cat;
  final int view;
  final int duration;
  final String permalink;

  const AlauneExtra(
      {required this.cat,
      required this.image,
      required this.text,
      required this.view,
      required this.duration,
      required this.permalink,
      super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetail(
                          permalink: permalink,
                        )));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.09,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: Column(
                    children: [
                      TextWidget(
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.w500,
                          text: text,
                          textColor: app_color.black,
                          overflow: TextOverflow.ellipsis,
                          maxLine: 3),
                      SizedBox(height: screenHeight * 0.006),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: app_color.primary,
                                size: screenWidth * 0.028,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              TextWidget(
                                fontSize: screenWidth * 0.025,
                                fontWeight: FontWeight.w600,
                                text: cat.toUpperCase(),
                                textColor: app_color.primary,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                color: app_color.lightTextSoft,
                                size: screenWidth * 0.03,
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              TextWidget(
                                fontSize: screenWidth * 0.025,
                                fontWeight: FontWeight.w500,
                                text: view.toString(),
                                textColor: app_color.lightTextSoft,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        const MyDivider(),
        SizedBox(height: screenHeight * 0.01),
      ],
    );
  }
}
