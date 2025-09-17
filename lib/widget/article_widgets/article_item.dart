import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';

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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child:
                widget.article.urlToImage != null
                    ? Image.network(
                      widget.article.urlToImage!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                    : Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        size: 60,
                        color: Colors.black,
                      ),
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
