import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:la_nation/constants/env.config.dart';
import 'package:http/http.dart' as http;
import 'package:la_nation/models/tags.dart';

class TagService {
  Future<Tags> getTags() async {
    var client = http.Client();
    var uri = Uri.parse('$baseUrl/tags');

    try {
      Response response = await client.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        return Tags.fromJson(jsonResponse);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } finally {
      client.close();
    }
  }
}

class SingleTagService {
  Future<SingleTag> getTags(String id) async {
    var client = http.Client();
    var uri = Uri.parse('$baseUrl/tags/$id');

    try {
      Response response = await client.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

        return SingleTag.fromJson(jsonResponse);
      } else {
        throw Exception(response.reasonPhrase);
      }
    } finally {
      client.close();
    }
  }
}

class QueryService {
  Future<Tags?> getQuery(String query) async {
    var client = http.Client();

    var uri = Uri.parse('$baseUrl/search?q=$query');

    try {
      if (query.length > 2) {
        Response response = await client.get(uri);

        if (response.statusCode == 200) {
          final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

          print(jsonResponse);

          return Tags.fromJson(jsonResponse);
        } else {
          throw Exception(response.reasonPhrase);
        }
      }
      return null;
    } finally {
      client.close();
    }
  }
}

final tagProvider = Provider<TagService>((ref) => TagService());
final singleTagProvider = Provider<SingleTagService>((ref) => SingleTagService());
final queryProvider = StateProvider<QueryService>((ref) => QueryService());
