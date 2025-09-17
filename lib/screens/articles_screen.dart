import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/services/api_services.dart';
import '../consts.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key, required this.category});

  final String category;

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  List<Article>? articles;

  @override
  void initState() {
    super.initState();
    getArticleCategory();
  }

  getArticleCategory() async {
    articles = await ApiServices().getNews(widget.category.toLowerCase());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isExpandedDescription = false;

    return Scaffold(
      appBar: AppBar(title: Text(" News ${widget.category}")),
      body:
          articles == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) {
                  final article = articles![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "ArticleDetailsScreen",
                          arguments: article,
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            child: Image.network(
                              article.urlToImage ?? imageGeneral,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            article.title ?? "No Title",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpandedDescription = !isExpandedDescription;
                              });
                            },
                            child: Text(
                              maxLines: isExpandedDescription ? null : 2,
                              overflow:
                                  isExpandedDescription
                                      ? TextOverflow.visible
                                      : TextOverflow.ellipsis,
                              article.description ?? "No Description",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
