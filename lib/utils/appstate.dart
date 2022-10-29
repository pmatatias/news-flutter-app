import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  String _baseUrl = '';
  String _apiKey = '';

  String get baseUrl => _baseUrl;
  String get apiKey => _apiKey;

  void setBaseUrl(String newUrl) {
    _baseUrl = newUrl;
    notifyListeners();
  }

  void setAPIkey(String newKey) {
    _apiKey = newKey;
    notifyListeners();
  }
}
