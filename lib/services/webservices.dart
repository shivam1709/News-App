import 'package:http/http.dart' as http;
import 'package:newsapp/constants.dart';
import 'package:newsapp/model/article_model.dart';

class Webservice {
  Future<List<ArticleElement>> fetchHeadlinesByKeywords(String keyword) async {
    final response = await http.get(Constants.headlinesfor(keyword));
    if (response.statusCode == 200) {
      final article = articleFromJson(response.body);
      return article.articles;
    } else {
      throw Exception("Failed to get top news");
    }
  }

  Future<List<ArticleElement>> fetchTopHeadlines() async {
    final response = await http.get(Constants.TOP_HEADLINES_URL);

    if (response.statusCode == 200) {
      final article = articleFromJson(response.body);
      return article.articles;
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
