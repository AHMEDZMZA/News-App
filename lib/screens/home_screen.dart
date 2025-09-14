import 'package:flutter/material.dart';
import 'package:news_app/styles.dart';
import '../widget/article_widgets/article_listview.dart';
import '../widget/category_widgets/category_listview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryListview(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "General News",
                style: Styles.style30.copyWith(color: Colors.black),
              ),
            ),
            ArticleListview(),
          ],
        ),
      ),
    );
  }
}
