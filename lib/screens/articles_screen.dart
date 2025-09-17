import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/services/api_services.dart';

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
    bool isExpandedDescription = true;

    return Scaffold(
      appBar: AppBar(title: Text(" News ${widget.category}")),
      body:
          articles == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: articles!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(
                                context,
                                "ArticleDetailsScreen",
                                arguments: articles![index],
                              );
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child:
                                  articles![index].urlToImage != null
                                      ? Image.network(
                                        articles![index].urlToImage!,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                      : Container(
                                        width: double.infinity,
                                        height: 200,
                                        color: Colors.grey[300],
                                        child: const Icon(
                                          Icons.image_not_supported,
                                          size: 60,
                                          color: Colors.black,
                                        ),
                                      ),
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            articles![index].title ?? "No Title",
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
                              articles![index].description ?? "No Description",
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
