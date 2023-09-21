import 'package:flutter/material.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/screens/other_alaune/other_alaune.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class OtherAlauneItem extends StatelessWidget {
  final News item;

  const OtherAlauneItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewsDetail()));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              item.image,
              height: screenHeight * 0.2,
              width: screenWidth,
              fit: BoxFit.cover,
            ),
            TextWidget(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w600,
              text: item.text,
              textColor: app_color.black,
            ),
            SizedBox(height: screenHeight * 0.008),
            TextWidget(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.w400,
              text: item.duration,
              textColor: app_color.lightTextSoft,
            )
          ],
        ),
      ),
    );
  }
}
