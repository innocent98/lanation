import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchControllerProvider =
    StateNotifierProvider<SearchDataController, List>((ref) {
  return SearchDataController();
});

class SearchDataController extends StateNotifier<List> {
  SearchDataController() : super([]);

  void onSearchData(String query, List<dynamic> data) {
    state = [];
    if (query.isNotEmpty) {
      final result = data
          .where((element) => element['email']
              .toString()
              .toLowerCase()
              .contains(query.toString().toLowerCase()))
          .toSet()
          .toList();
      state.addAll(result);
    }
  }
}
