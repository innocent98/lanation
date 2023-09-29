import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:http/http.dart' as http;
import 'package:la_nation/models/news_details.dart';

class NewsDetailService {
  Future<NewsDetails> getNews(String dynamicUrl) async {
    var client = http.Client();
    var uri = Uri.parse('$baseUrl/newscasts/$dynamicUrl');

    try {
      Response response = await client.get(uri);

      if (response.statusCode == 200) {
        final List jsonResponse = jsonDecode(response.body);
        return NewsDetails.fromJson(jsonResponse);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } finally {
      client.close();
    }
  }
}

final newsDetailProvider =
    Provider<NewsDetailService>((ref) => NewsDetailService());
