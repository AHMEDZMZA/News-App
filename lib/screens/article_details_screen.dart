import 'package:flutter/material.dart';
import '../consts.dart';
import '../model/article.dart';
import '../styles.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen({super.key});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  bool isExpandedDescription = false;
  bool isExpandedContent = false;

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title ?? "No Title"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(data.urlToImage ?? imageGeneral),
            ),
            const SizedBox(height: 8),
            Text(
              data.title ?? "No Title",
              style: Styles.style30.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text("Author:", style: Styles.style30.copyWith(fontSize: 18)),
                const SizedBox(width: 8),
                Text(
                  "By ${data.author ?? "Unknown"}",
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const Divider(height: 24),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Published At:",
                  style: Styles.style30.copyWith(fontSize: 18),
                ),
                const SizedBox(width: 8),
                Text(
                  data.publishedAt ?? "No Published At",
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
            const Divider(height: 24),
            Text("Description:", style: Styles.style30.copyWith(fontSize: 18)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpandedDescription = !isExpandedDescription;
                });
              },
              child: Text(
                maxLines: isExpandedDescription ? null : 2,
                overflow:
                    isExpandedDescription
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                data.description ?? "No Description",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            const Divider(height: 24),
            Text("Content:", style: Styles.style30.copyWith(fontSize: 18)),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpandedContent = !isExpandedContent;
                });
              },
              child: Text(
                maxLines: isExpandedContent ? null : 2,
                overflow:
                    isExpandedContent
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                data.content ?? "No Content",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            const Divider(height: 24),
            Text("Url:", style: Styles.style30.copyWith(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              data.url ?? "No Url",
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
