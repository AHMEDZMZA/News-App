import '../consts.dart';

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

List<Category> categories = [
  Category(name: "Business", image: imageBusiness),
  Category(name: "Entertainment", image: imageEntertainment),
  Category(name: "Health", image: imageHealth),
  Category(name: "Science", image: imageScience),
  Category(name: "Sports", image: imageSport),
  Category(name: "Technology", image: imageTechnology),
];