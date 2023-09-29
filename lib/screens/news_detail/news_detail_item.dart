import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:la_nation/models/news_details.dart';
import 'package:la_nation/providers/font_provider.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class NewsDetailItem extends ConsumerWidget {
  final NewsDetails item;
  final int index;

  const NewsDetailItem({required this.item, required this.index, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    DateTime dateFormat = DateTime.parse(item.data[index].createdAt!);

    final fontSize = ref.watch(fontSizeProvider);

    RegExp formatText =
        RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    List<Widget> formattedParagraphList =
        item.data[index].paragraphs!.map((item) {
      return Column(children: [
        TextWidget(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          text: item.content!.replaceAll(formatText, ''),
          textColor: app_color.darkBackground,
        ),
        SizedBox(height: screenHeight * 0.03),
        Image.network(
          '$imgUrl${item.insertion?.fichier!.path}',
          height: screenHeight * 0.3,
          width: screenWidth,
          fit: BoxFit.contain,
        ),
        SizedBox(height: screenHeight * 0.03),
      ]);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: app_color.primary,
              size: screenWidth * 0.03,
            ),
            SizedBox(width: screenWidth * 0.02),
            TextWidget(
              fontSize: screenWidth * 0.035,
              fontWeight: FontWeight.w600,
              text: item.data[index].modules!.name!,
              textColor: app_color.primary,
            ),
          ],
        ),
        TextWidget(
          fontSize: screenWidth * 0.032,
          fontWeight: FontWeight.w400,
          text: item.data[index].author!,
          textColor: app_color.lightTextSoft,
        ),
        SizedBox(
          height: screenHeight * 0.06,
        ),
        TextWidget(
          fontSize: screenWidth * 0.055,
          fontWeight: FontWeight.w700,
          text: item.data[index].title!,
          textColor: app_color.darkBackground,
        ),
        TextWidget(
          fontSize: screenWidth * 0.03,
          fontWeight: FontWeight.w500,
          text: 'Le ${DateFormat('dd MMMM, yyyy', 'fr').format(dateFormat)}',
          textColor: app_color.lightTextSoft,
        ),
        Row(
          children: [
            Icon(
              Icons.schedule,
              color: app_color.darkBackground,
              size: screenWidth * 0.03,
            ),
            SizedBox(width: screenWidth * 0.02),
            TextWidget(
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.w500,
              text: '${item.data[index].duration}min de lecture',
              textColor: app_color.lightTextSoft,
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.06),
        TextWidget(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          text: item.data[index].content!.replaceAll(formatText, ''),
          textColor: app_color.darkBackground,
        ),
        SizedBox(height: screenHeight * 0.03),
        Image.network(
          '$imgUrl${item.data[index].fichier!.path}',
          height: screenHeight * 0.3,
          width: screenWidth,
          fit: BoxFit.contain,
        ),
        SizedBox(height: screenHeight * 0.03),
        Column(
          children: formattedParagraphList,
        )
      ],
    );
  }
}
