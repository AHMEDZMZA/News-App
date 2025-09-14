import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import '../../styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 60,
        backgroundImage: NetworkImage(category.image),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        child: Text(category.name, style: Styles.style30),
      ),
    );
  }
}
