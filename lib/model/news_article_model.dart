
import 'package:newsapp/model/article_model.dart';

class NewsArticleModel {

  ArticleElement _newsArticle;

  NewsArticleModel({ArticleElement article}): _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageURL {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}