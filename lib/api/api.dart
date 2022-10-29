import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/model.dart';

Future<NewsInfo> fetchNewsInfo() async {
  try {
    final resp = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=Apple&from=2022-10-29&sortBy=popularity&apiKey=9c971c6e43114b9086515f110d534e50'));

    if (resp.statusCode == 200) {
      final result = NewsInfo.fromJson(jsonDecode(resp.body));
      return result;
    } else {
      throw Exception(resp.body);
    }
  } catch (e) {
    throw Exception(e);
  }
}
