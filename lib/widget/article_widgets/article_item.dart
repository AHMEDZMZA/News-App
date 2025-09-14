import 'package:flutter/material.dart';
import '../../consts.dart';

class ArticleItem extends StatefulWidget {
  const ArticleItem({super.key});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  bool isExpanded = false;

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
              imageHealth,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text("TTitle/TitleTitleTitle", style: TextStyle(color: Colors.black)),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              maxLines: isExpanded ? null : 2,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              "TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
