import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/news_detail_provider.dart';
import 'package:la_nation/screens/news_detail/bottom_navigation.dart';
import 'package:la_nation/screens/news_detail/news_detail_item.dart';
import '../../constants/colors.dart' as app_color;

class NewsDetail extends ConsumerWidget {
  final String? permalink;

  const NewsDetail({super.key, this.permalink});

  @override
  Widget build(BuildContext context, ref) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(newsDetailDataProvider(permalink!));

    return Scaffold(
        backgroundColor: app_color.white,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.03,
                  screenWidth * 0.03, screenWidth * 0.03, 0),
              child: data.when(
                  data: (data) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return NewsDetailItem(
                            item: data!,
                            index: index,
                          );
                        });
                  },
                  error: (err, s) => Text(err.toString()),
                  loading: () => const Center(
                        child:
                            CircularProgressIndicator(color: app_color.primary),
                      )),
            ),
            const BottomNavigation()
          ],
        ));
  }
}
