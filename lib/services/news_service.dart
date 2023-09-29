import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:la_nation/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<News?> getNews() async {
    var client = http.Client();
    var uri = Uri.parse('$baseUrl/home');

    try {
      Response response = await client.get(uri);

      if (response.statusCode == 200) {
        final dynamic jsonResponse = jsonDecode(response.body);

        if (jsonResponse is Map<String, dynamic>) {
          return News.fromJson(jsonResponse);
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

final newsProvider = Provider<NewsService>((ref) => NewsService());



// final List result = jsonDecode(response.body);
        // print(result);
        // return result.map(((e) => News.fromJson(e))).toList();
        // var json = response.body;
        // newsFromJson(json);
