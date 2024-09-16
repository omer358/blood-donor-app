// presentation/screens/articles.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controllers/articles_controller.dart';
import 'article_details.dart';

class ArticlesScreen extends StatelessWidget {
  final ArticlesController articleController = Get.put(ArticlesController());

  ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (articleController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (articleController.articles.isEmpty) {
          return _buildEmptyState();
        } else {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: ListView.builder(
              itemCount: articleController.articles.length,
              itemBuilder: (context, index) {
                final article = articleController.articles[index];
                return InkWell(
                  onTap: (){
                    Get.to(() => ArticleDetailScreen(article: article));
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Article Image
                        if (article.imageUrl.isNotEmpty)
                          Image.network(
                            article.imageUrl,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        // Article Title
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            article.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
  Widget _buildEmptyState(){
    return Center(child:
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
            'assets/images/articles.svg',
          height: 180,
          width: 180,
        ),
         const SizedBox(height: 10,),
         const Text(
            'لا توجد مقالات متاحة حاليًا',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24
          )
        ),
      ],
    ));
  }
}
