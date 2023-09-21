import 'package:flutter/material.dart';
import 'package:la_nation/screens/alaune/alaune_item.dart';
import '../../constants/colors.dart' as app_color;

class Alaune extends StatefulWidget {
  const Alaune({super.key});

  @override
  State<Alaune> createState() => _AlauneState();
}

class _AlauneState extends State<Alaune> {
  List<News> news = [
    const News(
        image:
            'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
        text:
            '4e édition du Carnaval Kaleta: Cotonou Spectacles grand public et divers ateliers au menu.',
        cat: 'ECONOMIE',
        duration: 'Il y a 10 Mins',
        view: '526'),
    const News(
        image:
            'https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=',
        text:
            '4e édition du Carnaval Kaleta: Cotonou Spectacles grand public et divers ateliers au menu',
        cat: 'ECONOMIE',
        duration: 'Il y a 10 Mins',
        view: '526'),
    const News(
        image:
            'https://imgv3.fotor.com/images/cover-photo-image/a-beautiful-girl-with-gray-hair-and-lucxy-neckless-generated-by-Fotor-AI.jpg',
        text:
            '4e édition du Carnaval Kaleta: Cotonou Spectacles grand public et divers ateliers au menu',
        cat: 'ECONOMIE',
        duration: 'Il y a 10 Mins',
        view: '526'),
    const News(
        image:
            'https://thumbs.dreamstime.com/b/world-map-technological-background-best-internet-concept-global-business-elements-image-furnished-bright-lines-66529240.jpg',
        text:
            '4e édition du Carnaval Kaleta: Cotonou Spectacles grand public et divers ateliers au menu',
        cat: 'ECONOMIE',
        duration: 'Il y a 10 Mins',
        view: '526'),
    const News(
        image:
            'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
        text:
            '4e édition du Carnaval Kaleta: Cotonou Spectacles grand public et divers ateliers au menu',
        cat: 'ECONOMIE',
        duration: 'Il y a 10 Mins',
        view: '526'),
    const News(
        image:
            'https://www.befunky.com/images/prismic/82e0e255-17f9-41e0-85f1-210163b0ea34_hero-blur-image-3.jpg?auto=avif,webp&format=jpg&width=896',
        text:
            '4e édition du Carnaval Kaleta: Cotonou Spectacles grand public et divers ateliers au menu',
        cat: 'ECONOMIE',
        duration: 'Il y a 10 Mins',
        view: '526'),
    const News(
        image:
            'https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg',
        text:
            '4e édition du Carnaval Kaleta: Cotonou Spectacles grand public et divers ateliers au menu',
        cat: 'ECONOMIE',
        duration: 'Il y a 10 Mins',
        view: '526'),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: app_color.lightBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: app_color.lightBackground,
          body: SizedBox(
            width: screenWidth,
            child: FutureBuilder<String>(
              future: null,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: news.length,
                          itemBuilder: (context, index) {
                            final currentNews = news[index];
                            return AlauneItem(
                                item: currentNews,
                                index: index,
                                length: news.length);
                          }),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class News {
  final String image;
  final String text;
  final String view;
  final String cat;
  final String duration;

  const News({
    required this.image,
    required this.text,
    required this.cat,
    required this.duration,
    required this.view,
  });
}
