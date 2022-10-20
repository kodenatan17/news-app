import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/article_model.dart';

class ApiService {
  final url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=31fb2d816a0d45ad91ca69868b289226';
  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Tidak dapat articles");
    }
  }
}
