import 'package:flutter/material.dart';
import 'package:news_app/styles.dart';
import '../consts.dart';
import '../widget/article_widgets/article_listview.dart';
import '../widget/category_widgets/category_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("News App"),
      //   centerTitle: true,
      //   backgroundColor: Colors.teal,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("News App", style: TextStyle(color: Colors.white)),
              background: Image.network(imageAppBar, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(child: CategoryListview()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              child: Text(
                " General News",
                style: Styles.style30
                    .copyWith(color: Colors.black)
                    .copyWith(fontSize: 25),
              ),
            ),
          ),
          ArticleListview(),
        ],
      ),
    );
  }
}
