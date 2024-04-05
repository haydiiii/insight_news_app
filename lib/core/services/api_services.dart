import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:insight_news_app/core/constants/constant.dart';
import 'package:insight_news_app/features/model/news_model/news_model.dart';

class ApiServices {
  static Future<NewsModel?> getNewsByCategory(String category) async {
    try {
      var url = Uri.parse(
          '${ApiConstants.baseUrl + ApiConstants.topHeadlines}?country=us&category=$category&${ApiConstants.apiKey}');
      var res = await http.get(url, headers: {
        "Authorization":
            "Bearer 42|NJkEMFLGinUOeORDNnbs6pGPTovNegFgwyDn4hCy8a489b15"
      });
      if (res.statusCode == 200) {
        NewsModel model = NewsModel.fromJson(json.decode(res.body));
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
