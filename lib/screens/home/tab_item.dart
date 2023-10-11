import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/news_provider.dart';
import 'package:la_nation/screens/alaune/alaune.dart';
import 'package:la_nation/screens/other_alaune/other_alaune.dart';
import '../../constants/colors.dart' as app_color;

class TabItem extends ConsumerWidget {
  const TabItem({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(newsDataProvider);

    final List<SizedBox> tabListFormat = data.when(
      data: (data) {
        if (data != null && data.allnewscastsByModule != null) {
          return data.allnewscastsByModule!
              .map(
                (item) => SizedBox(
                  width: screenWidth * 0.3,
                  child: Tab(text: item.name),
                ),
              )
              .toList();
        } else {
          return <SizedBox>[];
        }
      },
      error: (err, s) => <SizedBox>[],
      loading: () {
        return <SizedBox>[];
      },
    );

    return SafeArea(
        child: DefaultTabController(
      length: tabListFormat.length + 1,
      child: Scaffold(
        backgroundColor: app_color.lightBackground,
        appBar: AppBar(
          toolbarHeight: 15,
          bottom: TabBar(
            isScrollable: true,
            labelColor: app_color.white,
            unselectedLabelColor: app_color.black,
            unselectedLabelStyle:
                const TextStyle(backgroundColor: app_color.transparent),
            labelStyle:
                const TextStyle(fontFamily: 'IBM', fontWeight: FontWeight.w500),
            indicator: BoxDecoration(
                color: app_color.primary,
                borderRadius: BorderRadius.circular(8)),
            tabs: [
              SizedBox(
                width: screenWidth * 0.3,
                child: const Tab(text: 'A LA UNE'),
              ),
              ...tabListFormat
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Alaune(),
            ...tabListFormat.mapIndexed((index, item) {
              return OtherAlaune(
                i: index,
              );
            }).toList(),
          ],
        ),
      ),
    ));
  }
}
