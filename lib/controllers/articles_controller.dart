// controllers/article_controller.dart
import 'package:blood_donor/service/articles_service.dart';
import 'package:get/get.dart';

import '../models/article_model.dart';

class ArticlesController extends GetxController {
  final ArticlesService _articleService = ArticlesService();
  var articles = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  // Fetch articles from the service and update the state
  void fetchArticles() async {
    try {
      isLoading(true);
      List<Article> fetchedArticles = await _articleService.fetchArticles();
      articles.value = fetchedArticles;
    } catch (e) {
      print('Error fetching articles: $e');
    } finally {
      isLoading(false);
    }
  }
}
