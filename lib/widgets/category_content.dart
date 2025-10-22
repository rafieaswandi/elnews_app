import 'package:aplication_news/controller/headlines_controller.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:aplication_news/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryContent extends StatelessWidget {
  final String category;
  CategoryContent({super.key, required this.category});

  late final HeadlinesController headlinesController = Get.put(
    HeadlinesController(category: category),
    tag: category,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async => headlinesController.fetchHeadlines(),
        child: headlinesController.obx(
          (state) => ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            itemCount: state?.articles.length,
            itemBuilder: (context, index) {
              final Article article = state?.articles[index];
              return NewsCard(article: article);
            },
          ),
          onError: (Error) {
            return Padding(
              padding: const EdgeInsets.all(10.90),
                child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('An error has occurred.', textAlign: TextAlign.center),
                  const SizedBox(height: 8.0),
                  OutlinedButton(
                    onPressed: () async =>
                        headlinesController.fetchHeadlines(),
                    child: Text('Try Again Plss :3'),
                  )
                  ],
                )
              ),
            );
          },
        ),
      ),
    );
  }
}