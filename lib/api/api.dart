import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/model.dart';
import 'package:news_app/utils/appstate.dart';
import 'package:news_app/utils/helper.dart';

Future<NewsInfo> fetchNewsInfo(AppState appState,
    {String type = 'everything',
    String sortby = 'popularity',
    String? query,
    String? fromDate}) async {
  String date = fromDate ?? dateToString(DateTime.now());
  String q = ((query != null) && (query != '')) ? query : 'news';

  try {
    final resp = await http.get(Uri.parse(
        '${appState.baseUrl}/$type?q=$q&from=$date&sortBy=$sortby&apiKey=${appState.apiKey}'));

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
