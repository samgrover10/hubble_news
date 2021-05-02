import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hubble_news/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsData with ChangeNotifier {
  List<NewsModel> _items = [];

  Future<void> getAndSetNews() async {
    final url = Uri.parse('https://hubblesite.org/api/v3/news');
    try {
      final response = await http.get(url);
      var responseArray = jsonDecode(response.body) as List;
      var newsItems = responseArray
          .map((e) =>
              NewsModel(id: e['news_id'], name: e['name'], url: e['url']))
          .toList();
      _items = newsItems;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  List<NewsModel> get items {
    return [..._items];
  }
}
