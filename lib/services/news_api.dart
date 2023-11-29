import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nows_app_udemy/models/news_model.dart';
import 'package:nows_app_udemy/utils/app_url.dart';

class NewsApiServices {
  List<NewsModel> newsList = [];

  Future<List<NewsModel>> getAllNews() async {
    final response = await http.get(Uri.parse(AppUrl.newsUri));

    var data = jsonDecode(response.body.toString());
    print('abid******************************************');

    if (response.statusCode == 200) {
      newsList.add(NewsModel.fromJson(data));
      print('data loadedd');
      return newsList;
    } else {
      print('not loaded');
    }
    return newsList;
  }
}
