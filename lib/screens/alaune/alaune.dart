import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/news_provider.dart';
import 'package:la_nation/screens/alaune/alaune_item.dart';
import '../../constants/colors.dart' as app_color;

class Alaune extends ConsumerWidget {
  const Alaune({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(newsDataProvider);

    return Container(
      color: app_color.lightBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: app_color.lightBackground,
          body: SizedBox(
            width: screenWidth,
            child: data.when(
                data: (data) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final currentNews = data!;
                        return AlauneItem(
                            item: currentNews, index: index, length: 1);
                      });
                  // return null;
                },
                error: (err, s) => Text(err.toString()),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    )),
          ),
        ),
      ),
    );
  }
}
