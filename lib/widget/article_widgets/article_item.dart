import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import '../../consts.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool isExpandedDescription = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.network(
              widget.article.urlToImage ?? imageGeneral,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.article.title ?? "No Title",
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
              widget.article.description ?? "No Description",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
