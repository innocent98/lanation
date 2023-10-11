import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:la_nation/models/news.dart';
import 'package:la_nation/providers/news_cast_provider.dart';
import 'package:la_nation/screens/alaune/les_articles.dart';
import 'package:la_nation/screens/alaune/service.dart';
import 'package:la_nation/screens/alaune/video.dart';
import 'package:la_nation/screens/alaune/alaune_extra.dart';
import 'package:la_nation/screens/alaune/alaune_main.dart';
import 'package:la_nation/screens/alaune/en_direct.dart';
import 'package:la_nation/screens/alaune/en_direct_list.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class AlauneItem extends ConsumerWidget {
  final News item;
  final int index;
  final int length;

  const AlauneItem(
      {required this.item,
      required this.index,
      required this.length,
      super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final newsData = ref.watch(newsCastDataProvider);

    List<Widget> formattedServiceList = news2.map((item) {
      return Service(item: item);
    }).toList();

    final inLiveNewscasts = newsData.when(
        data: (newsData) {
          List<Widget> newsDataList = newsData!.data!.slice(0, 4).map((item) {
            return AlauneExtra(
              cat: item.modules!.name.toString(),
              image: '$imgUrl${item.fichier!.path}',
              text: item.title!,
              view: item.view!,
              duration: item.duration!,
              permalink: item.permalink!,
            );
          }).toList();
          return Column(
            children: newsDataList,
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));

    List<Widget> formattedEnDirect = item.inLiveNewscasts!.map((item) {
      return EnDirect(
        image: '$imgUrl${item.fichier!.path}',
        duration: item.duration!,
        text: item.title!,
        author: item.author!,
        date: item.created_at!,
        permalink: item.permalink!,
      );
    }).toList();

    final unDirectList = newsData.when(
        data: (newsData) {
          List<Widget> newsDataList = newsData!.data!.slice(4).map((item) {
            return EnDirectList(
              image: '$imgUrl${item.fichier!.path}',
              duration: item.duration!,
              text: item.title!,
              date: item.created_at!,
              view: item.view!,
              permalink: item.permalink!,
            );
          }).toList();
          return Column(
            children: newsDataList,
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));

    List<Widget> formattedVideoList =
        item.latestVideos!.slice(0, 3).map((item) {
      return MyVideo(text: item.title!, videoUrl: item.link!);
    }).toList();

    List<Widget> formattedLesArticle =
        item.overViewNewscasts!.mapIndexed((index, item) {
      return LesArticle(
        text: item.title!,
        num: index + 1,
        permalink: item.permalink!,
      );
    }).toList();

    final principalNewscats = item.principalNewscats;

    return Container(
      color: app_color.lightBackground,
      child: SizedBox(
        width: screenWidth,
        child: Column(
          children: [
            AlauneMain(
              image: '$imgUrl${principalNewscats!.fichier!.path}',
              text: principalNewscats.title.toString(),
              permalink: principalNewscats.permalink!,
            ),

            // alaune extra
            inLiveNewscasts,
            SizedBox(height: screenHeight * 0.01),

            // en direct
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.035,
                  screenWidth * 0.06, screenWidth * 0.035, screenWidth * 0.06),
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

                  SizedBox(
                    height: screenHeight * 0.4,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: formattedEnDirect),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // en_direct list
                  unDirectList,

                  // viedos
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

                  // articles
                  TextWidget(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.w700,
                    text: 'LES 6 ARTICLES LE PLUS LUS',
                    textColor: app_color.primary,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Column(
                    children: formattedLesArticle,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // services
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
          ],
        ),
      ),
    );
  }
}

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
