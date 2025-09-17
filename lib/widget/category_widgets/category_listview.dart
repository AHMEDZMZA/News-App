import 'package:flutter/material.dart';
import '../../model/category.dart';
import 'category_item.dart';

class CategoryListview extends StatefulWidget {
  const CategoryListview({super.key});

  @override
  State<CategoryListview> createState() => _CategoryListviewState();
}

class _CategoryListviewState extends State<CategoryListview> {
  @override
  Widget build(BuildContext context) {
    return
    // CategoryItem(category: Category(name: categories[0].name, image:  categories[0].image)),
    SizedBox(
      height: 170,
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
