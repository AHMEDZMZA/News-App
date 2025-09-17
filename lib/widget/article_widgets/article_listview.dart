import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/services/api_services.dart';
import '../../model/category.dart';
import 'article_item.dart';

class ArticleListview extends StatefulWidget {
  const ArticleListview({super.key});

  @override
  State<ArticleListview> createState() => _ArticleListviewState();
}

class _ArticleListviewState extends State<ArticleListview> {
  ApiServices apiServices = ApiServices();
  Category? category;
  List<Article>? article;

  @override
  void initState() {
    super.initState();
    getArticle();
  }

  getArticle() async {
    article = await apiServices.getNews("general");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return article == null
        ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
        : SliverList.builder(
          // child: ListView.builder(
          // shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          itemCount: article!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ArticleItem(article: article![index]),
            );
          },
        );
  }
}
