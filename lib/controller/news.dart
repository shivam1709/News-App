import 'package:http/http.dart' as http;
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/model/news_article_model.dart';
import 'dart:convert';

import 'package:newsapp/services/webservices.dart';

class News {
  List<ArticleElement> news = [];
  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=8056694444d14962bad453d20667bcc2";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleElement article = ArticleElement(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}

class NewsForCategorie {
  List<ArticleElement> newss = [];

  Future<void> getNewsForCategory(String category) async {
    String url =
        //   "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=8056694444d14962bad453d20667bcc2";
        "https://newsapi.org/v2/top-headlines?country=in&category=${category}&apiKey=8056694444d14962bad453d20667bcc2";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleElement article = ArticleElement(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
          );
          newss.add(article);
        }
      });
    }
  }
}

class Search {
  List<NewsArticleModel> articles = [];

  Future <List> search(String keyword) async {
    List<ArticleElement> newsArticles =
        await Webservice().fetchHeadlinesByKeywords(keyword);
    return articles = newsArticles
        .map((article) => NewsArticleModel(article: article))
        .toList();
  }
}
