// service/article_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/article_model.dart';

class ArticlesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch articles from Firestore
  Future<List<Article>> fetchArticles() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('articles').get();
      return snapshot.docs
          .map((doc) => Article.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching articles: $e');
      return [];
    }
  }
}
