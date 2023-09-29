import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/models/news_cast.dart';
import 'package:la_nation/services/news_cast_service.dart';

final newsCastDataProvider = FutureProvider<NewsData?>((ref) async {
  return ref.watch(newsCastProvider).getNews();
});
