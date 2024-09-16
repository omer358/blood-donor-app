// models/article.dart
class Article {
  final String title;
  final String imageUrl;
  final String body;

  Article({required this.title, required this.imageUrl, required this.body});

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      body: map['body'] ?? ''
    );
  }
}
