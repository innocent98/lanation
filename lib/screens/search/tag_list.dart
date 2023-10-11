import 'package:flutter/material.dart';
import 'package:la_nation/models/tags.dart';
import 'package:la_nation/screens/search/single_search.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class TagList extends StatelessWidget {
  final TagItem item;

  const TagList({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleSearch(
                      id: item.id.toString(),
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03, vertical: screenWidth * 0.02),
        decoration: BoxDecoration(
            color: app_color.primary, borderRadius: BorderRadius.circular(20)),
        child: TextWidget(
            fontSize: screenWidth * 0.033,
            fontWeight: FontWeight.w400,
            text: item.title!),
      ),
    );
  }
}
