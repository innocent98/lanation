import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:la_nation/models/news.dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class OtherAlauneItem extends StatelessWidget {
  final AllNewscastsByModule item;

  const OtherAlauneItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<Widget> newsLists = item.newscasts!.map((item) {
      final DateTime dateTime = DateTime.parse(item.created_at!);

      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetail(
                        permalink: item.permalink,
                      )));
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: screenHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                '$imgUrl${item.fichier?.path}',
                height: screenHeight * 0.2,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
              TextWidget(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w600,
                text: item.title!,
                textColor: app_color.black,
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    fontSize: screenWidth * 0.032,
                    fontWeight: FontWeight.w400,
                    text:
                        'Le ${DateFormat('dd MMMM, yyyy', 'fr').format(dateTime)}',
                    textColor: app_color.lightTextSoft,
                  ),
                  TextWidget(
                    fontSize: screenWidth * 0.032,
                    fontWeight: FontWeight.w500,
                    text: '${item.duration}min de lecture',
                    textColor: app_color.lightTextSoft,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: newsLists,
    );
  }
}
