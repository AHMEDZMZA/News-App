import '../consts.dart';

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

List<Category> categories = [
  Category(name: "General", image: imageGeneral),
  Category(name: "Sports", image: imageSport),
  Category(name: "Health", image: imageHealth),
  Category(name: "Business", image: imageBusiness),
];
