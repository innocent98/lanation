import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/models/news_details.dart';
import 'package:la_nation/services/news_detail_service.dart';

final newsDetailDataProvider =
    FutureProvider.family<NewsDetails?, String>((ref, dynamicUrl) async {
  return ref.watch(newsDetailProvider).getNews(dynamicUrl);
});
