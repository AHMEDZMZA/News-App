import 'package:dio/dio.dart';
import 'package:news_app/model/article.dart';

class ApiServices {
  Dio dio = Dio();

  Future<List<Article>> getNews(String value) async {
    Response response = await dio.get(
      "https://newsapi.org/v2/top-headlines?country=us&category=$value&apiKey=b051929dddce440594270b6a4611cff0",
    );
    Map<String, dynamic> json = response.data;
    List<Article> article = [];
    for (var item in json["articles"]) {
      article.add(
        Article(
          author: item["author"],
          title: item["title"],
          description: item["description"],
          url: item["url"],
          urlToImage: item["urlToImage"],
          publishedAt: item["publishedAt"],
          content: item["content"],
        ),
      );
    }
    return article;
  }
}
