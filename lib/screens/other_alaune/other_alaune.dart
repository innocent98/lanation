import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/news_provider.dart';
import 'package:la_nation/screens/other_alaune/other_alaune_item.dart';
import '../../constants/colors.dart' as app_color;

class OtherAlaune extends ConsumerWidget {
  final int i;

  const OtherAlaune({required this.i, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final data = ref.watch(newsDataProvider);

    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.03),
      child: FutureBuilder(
        future: null,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return SizedBox(
            height: screenHeight * 0.4,
            child: data.when(
                data: (data) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        final currentNews =
                            data!.allnewscastsByModule!.slice(i, i + 1)[index];
                        return OtherAlauneItem(item: currentNews);
                      });
                },
                error: (err, s) => Text(err.toString()),
                loading: () => const Center(
                      child:
                          CircularProgressIndicator(color: app_color.primary),
                    )),
          );
        },
      ),
    );
  }
}
