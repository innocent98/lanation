import 'package:flutter/material.dart';
import 'package:la_nation/constants/divider.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:la_nation/models/tags.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class SearchItem extends StatelessWidget {
  final TagItem item;

  const SearchItem({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetail(
                        permalink: item.permalink,
                      )),
            );
          },
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '$imgUrl${item.fichier}',
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
                        text: item.title!,
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
                              text: item.categorie!.toUpperCase(),
                              textColor: app_color.primary,
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
        SizedBox(height: screenHeight * 0.01),
        const MyDivider(),
        SizedBox(height: screenHeight * 0.01),
      ],
    );
  }
}
