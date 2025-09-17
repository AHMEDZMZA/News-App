import 'package:flutter/material.dart';
import 'package:news_app/screens/article_details_screen.dart';
import 'package:news_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"ArticleDetailsScreen": (context) => ArticleDetailsScreen()},
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
