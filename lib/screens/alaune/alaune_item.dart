import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:la_nation/screens/alaune/les_articles.dart';
import 'package:la_nation/screens/alaune/service.dart';
import 'package:la_nation/screens/alaune/video.dart';
import 'package:la_nation/screens/alaune/alaune.dart';
import 'package:la_nation/screens/alaune/alaune_extra.dart';
import 'package:la_nation/screens/alaune/alaune_main.dart';
import 'package:la_nation/screens/alaune/en_direct.dart';
import 'package:la_nation/screens/alaune/en_direct_list.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class AlauneItem extends StatefulWidget {
  final News item;
  final int index;
  final int length;

  const AlauneItem(
      {required this.item,
      required this.index,
      required this.length,
      super.key});

  @override
  State<AlauneItem> createState() => _AlauneItemState();
}

class _AlauneItemState extends State<AlauneItem> {
  List<News2> news2 = [
    const News2(
        author: 'Radji Mouhammed',
        date: 'Le 29, decembre 2022',
        duration: '5 min de lecture',
        image:
            'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg',
        text:
            'Mort de Pelé : les ambiguïtés politiques du « roi » du football, loin des terrains'),
    const News2(
        author: 'Radji Mouhammed',
        date: 'Le 29, decembre 2022',
        duration: '5 min de lecture',
        image:
            'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg',
        text:
            'Mort de Pelé : les ambiguïtés politiques du « roi » du football, loin des terrains'),
    const News2(
        author: 'Radji Mouhammed',
        date: 'Le 29, decembre 2022',
        duration: '5 min de lecture',
        image:
            'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg',
        text:
            'Mort de Pelé : les ambiguïtés politiques du « roi » du football, loin des terrains'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    List<Widget> formattedEnDirectList = news2.map((item) {
      return EnDirectList(item: item);
    }).toList();

    List<Widget> formattedVideoList = news2.map((item) {
      return MyVideo(item: item);
    }).toList();

    List<Widget> formattedLesArticle = news2.mapIndexed((index, item) {
      return LesArticle(
        item: item,
        num: index,
      );
    }).toList();

    List<Widget> formattedServiceList = news2.map((item) {
      return Service(item: item);
    }).toList();

    return Container(
      color: app_color.lightBackground,
      child: SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            if (widget.index == 0)
              AlauneMain(image: widget.item.image, text: widget.item.text)
            else
              widget.index + 1 <= widget.length
                  ? AlauneExtra(
                      cat: widget.item.cat,
                      image: widget.item.image,
                      text: widget.item.text,
                      view: widget.item.view,
                      duration: widget.item.duration)
                  : Container(),
            SizedBox(height: screenHeight * 0.01),
            Divider(
              thickness: 1,
              color: app_color.darkTextSoft,
              height: 2,
            ),
            SizedBox(height: screenHeight * 0.01),
            if (widget.index + 1 == widget.length)
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.035,
                    screenWidth * 0.06,
                    screenWidth * 0.035,
                    screenWidth * 0.06),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      text: 'EN DIRECT',
                      textColor: app_color.red,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    FutureBuilder(
                      future: null,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return SizedBox(
                          height: screenHeight * 0.4,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: news2.length,
                              itemBuilder: (context, index) {
                                final currentNews = news2[index];
                                return EnDirect(item: currentNews);
                              }),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: formattedEnDirectList),
                    SizedBox(height: screenHeight * 0.02),
                    TextWidget(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      text: 'NOS VIDEOS',
                      textColor: app_color.primary,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      height: screenHeight * 0.4,
                      width: screenWidth,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: formattedVideoList,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    TextWidget(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      text: 'LES 6 ARTICLES LE PLUS LUS',
                      textColor: app_color.primary,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      height: screenHeight * 0.3,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: formattedLesArticle,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    TextWidget(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      text: 'NOS SERVICES',
                      textColor: app_color.primary,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      height: screenHeight * 0.3,
                      width: screenWidth,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: formattedServiceList,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.w400,
                            text: '© 2023 La Nation Benin.',
                            textColor: app_color.lightTextSoft,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}

class News2 {
  final String image;
  final String date;
  final String text;
  final String duration;
  final String author;

  const News2(
      {required this.author,
      required this.date,
      required this.duration,
      required this.image,
      required this.text});
}
