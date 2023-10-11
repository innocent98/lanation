import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/constants/divider.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:la_nation/constants/my_app_bar.dart';
import 'package:la_nation/providers/tags_provider..dart';
import 'package:la_nation/screens/news_detail/news_detail.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class SingleSearch extends ConsumerWidget {
  final String id;

  const SingleSearch({required this.id, super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final tagData = ref.watch(singleTagDataProvider(id));

    return Scaffold(
      appBar: MyAppBar.build(context, 'Recherche'),
      body: Column(
        children: [
          Column(
            children: tagData.when(
                data: (data) {
                  return data!.newscasts!.map((item) {
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
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: item.fichier?.path != null
                                  ? Image.network(
                                      '$imgUrl${item.fichier?.path}',
                                      width: screenWidth * 0.3,
                                      height: screenHeight * 0.09,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      'assets/img/tab1.png',
                                      width: screenWidth * 0.3,
                                      height: screenHeight * 0.09,
                                      fit: BoxFit.contain,
                                    ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            SizedBox(
                              width: screenWidth * 0.6,
                              child: Column(
                                children: [
                                  TextWidget(
                                      fontSize: screenWidth * 0.032,
                                      fontWeight: FontWeight.w500,
                                      text: item.title!,
                                      textColor: app_color.black,
                                      overflow: TextOverflow.ellipsis,
                                      maxLine: 3),
                                  SizedBox(height: screenHeight * 0.006),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            color: app_color.primary,
                                            size: screenWidth * 0.028,
                                          ),
                                          SizedBox(width: screenWidth * 0.01),
                                          TextWidget(
                                            fontSize: screenWidth * 0.025,
                                            fontWeight: FontWeight.w600,
                                            text: item.type!,
                                            textColor: app_color.primary,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: app_color.lightTextSoft,
                                            size: screenWidth * 0.03,
                                          ),
                                          SizedBox(width: screenWidth * 0.01),
                                          TextWidget(
                                            fontSize: screenWidth * 0.025,
                                            fontWeight: FontWeight.w500,
                                            text: item.view.toString(),
                                            textColor: app_color.lightTextSoft,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList();
                },
                error: (err, s) => <Widget>[Text(err.toString())],
                loading: () {
                  return [const Center()];
                }),
          ),
          SizedBox(height: screenHeight * 0.01),
          const MyDivider(),
          SizedBox(height: screenHeight * 0.01),
        ],
      ),
    );
  }
}
