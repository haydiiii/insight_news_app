import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:insight_news_app/core/constants/constant.dart';
import 'package:insight_news_app/features/model/news_model/news_model/news_model.dart';

class ApiServices {
  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadlines}country=us&category=$category&${ApiConstants.apiKey}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        NewsModel model = NewsModel.fromJson(jsonBody);
        return model;
      } else {
        log('Failed to fetch news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching news: $e');
    }
    return null;
  }

  static Future<NewsModel?> getNewsBySource(String source) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadlines}source=$source&${ApiConstants.apiKey}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        NewsModel model = NewsModel.fromJson(jsonBody);
        return model;
      } else {
        log('Failed to fetch news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching news: $e');
    }
    return null;
  }

  static Future<NewsModel?> getNewsBySearch(String query) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadlines}q=$query&${ApiConstants.apiKey}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonBody = json.decode(response.body);
        NewsModel model = NewsModel.fromJson(jsonBody);
        return model;
      } else {
        log('Failed to fetch news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching news: $e');
    }
    return null;
  }
}
