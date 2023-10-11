import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/providers/tags_provider..dart';
import 'package:la_nation/screens/home/top_bar.dart';
import 'package:la_nation/screens/search/search_item.dart';
import 'package:la_nation/screens/search/tag_list.dart';
import 'package:la_nation/widgets/text_form.dart';
import 'package:la_nation/widgets/text_widget.dart';
import '../../constants/colors.dart' as app_color;

class Search extends ConsumerWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final TextEditingController search = TextEditingController();

    final formKey = GlobalKey<FormState>();

    final tags = ref.watch(tagDataProvider);
    final query = ref.watch(queryDataProvider(search.text));

    final tagLists = tags.when(
        data: (data) {
          return data?.data?.map((item) {
                return TagList(item: item);
              }).toList() ??
              <Widget>[];
        },
        error: (err, s) => <Widget>[Text(err.toString())],
        loading: () {
          return [
            const Center(
              child: CircularProgressIndicator(),
            ),
          ];
        });

    final queryList = query.when(
        data: (data) {
          return data?.data?.map((item) {
                return SearchItem(item: item);
              }).toList() ??
              <Widget>[];
        },
        error: (err, s) => <Widget>[Text(err.toString())],
        loading: () {
          return [
            const Center(
              child: CircularProgressIndicator(),
            )
          ];
        });

    return Scaffold(
      backgroundColor: app_color.white,
      appBar: MyAppBar.build(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.01),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextForm(
                    controller: search,
                    keyboardType: TextInputType.text,
                    labelText: 'Search',
                    labelColor: app_color.primary,
                    onChanged: (query) {
                      if (search.text.length > 2) {
                        ref.read(queryDataProvider(query));
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            TextWidget(
              fontSize: screenWidth * 0.032,
              fontWeight: FontWeight.w400,
              text: 'Recherche rapide',
              textColor: app_color.lightTextSoft,
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: screenWidth,
                  child: search.text.length < 2
                      ? Wrap(
                          spacing: screenWidth * 0.04,
                          runSpacing: screenHeight * 0.01,
                          children: tagLists,
                        )
                      : Column(children: queryList),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
