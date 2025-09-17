import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';
import '../../screens/articles_screen.dart';
import '../../styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticlesScreen(category: category.name),
            ),
          );
        },
        child: SizedBox(
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(category.image),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                // child: Text(category.name, style: Styles.style30),
              ),
              SizedBox(height: 8),
              Text(category.name, style: Styles.style30),
            ],
          ),
        ),
      ),
    );
  }
}
