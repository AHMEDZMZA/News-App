import 'package:flutter/material.dart';
import 'article_item.dart';

class ArticleListview extends StatelessWidget {
  const ArticleListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ArticleItem();
        },
      ),
    );
  }
}
