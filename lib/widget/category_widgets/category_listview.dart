import 'package:flutter/material.dart';
import '../../model/category.dart';
import 'category_item.dart';

class CategoryListview extends StatelessWidget {
  const CategoryListview({super.key});

  @override
  Widget build(BuildContext context) {
    return
    // CategoryItem(category: Category(name: categories[0].name, image:  categories[0].image)),
    SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(category: categories[index]);
        },
      ),
    );
  }
}
