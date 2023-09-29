import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/models/news.dart';
import 'package:la_nation/services/news_service.dart';

final newsDataProvider = FutureProvider<News?>((ref) async {
  return ref.watch(newsProvider).getNews();
});
