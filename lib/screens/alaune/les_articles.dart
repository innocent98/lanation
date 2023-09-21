import 'package:flutter/material.dart';
import 'package:la_nation/screens/alaune/alaune_item.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class LesArticle extends StatelessWidget {
  final News2 item;
  final int num;

  const LesArticle({super.key, required this.item, required this.num});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewsDetail()));
      },
      child: SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            Row(
              children: [
                TextWidget(
                  fontSize: screenWidth * 0.1,
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
                    text: item.text,
                    textColor: app_color.black,
                  ),
                ),
              ],
            ),
            Divider(
              color: app_color.darkTextSoft,
              height: 2,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
