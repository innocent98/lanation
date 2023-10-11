import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:la_nation/models/tags.dart';
import 'package:la_nation/services/tags_service.dart';

final tagDataProvider = FutureProvider<Tags?>((ref) async {
  return ref.watch(tagProvider).getTags();
});

final singleTagDataProvider =
    FutureProvider.family<SingleTag?, String>((ref, id) async {
  return ref.watch(singleTagProvider).getTags(id);
});

final queryDataProvider =
    FutureProvider.family<Tags?, String>((ref, query) async {
  return ref.watch(queryProvider).getQuery(query);
});

final searchDataProvider = StateProvider<String>((ref) => '');
