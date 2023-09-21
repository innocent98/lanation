import 'package:flutter/material.dart';
import 'package:la_nation/screens/alaune/alaune_item.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class EnDirect extends StatelessWidget {
  final News2 item;

  const EnDirect({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewsDetail()));
      },
      child: Row(
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    app_color.black.withOpacity(0.5), BlendMode.srcATop),
                child: Image.network(
                  item.image,
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: screenWidth * 0.08,
                left: screenWidth * 0.03,
                width: screenWidth * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w400,
                            text: item.date),
                        Icon(
                          Icons.bookmark_border,
                          size: screenWidth * 0.06,
                          color: app_color.white,
                        )
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextWidget(
                        fontSize: screenWidth * 0.048,
                        fontWeight: FontWeight.w600,
                        text: item.text),
                    SizedBox(height: screenHeight * 0.12),
                    TextWidget(
                        fontSize: screenWidth * 0.038,
                        fontWeight: FontWeight.w400,
                        text: item.author),
                    TextWidget(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w400,
                        text: item.duration)
                  ],
                )),
          ]),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
    );
  }
}
