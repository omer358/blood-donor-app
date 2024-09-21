import 'package:flutter/material.dart';

import '../../models/article_model.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title, style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,  // Make the text right-to-left
          child: Padding(
            padding: const EdgeInsets.all(16.0),  // Adding consistent padding
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Article image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners for the image
                    child: Image.network(
                      article.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Article title
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Article body
                  Text(
                    article.body,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.0,
                      height: 1.5,  // Line height for readability
                    ),
                    textAlign: TextAlign.justify, // Make the text more readable
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
