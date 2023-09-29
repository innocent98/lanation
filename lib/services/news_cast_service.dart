import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:http/http.dart' as http;
import 'package:la_nation/models/news_cast.dart';

class NewsCastService {
  Future<NewsData?> getNews() async {
    var client = http.Client();
    var uri = Uri.parse('$baseUrl/newscasts');

    try {
      Response response = await client.get(uri);

      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);

        if (jsonResponse is Map<String, dynamic>) {
          return NewsData.fromJson(jsonResponse);
        } else {
          throw Exception('Invalid JSON structure');
        }
      } else {
        throw Exception(response.reasonPhrase);
      }
    } finally {
      client.close();
    }
  }
}

final newsCastProvider = Provider<NewsCastService>((ref) => NewsCastService());
