import 'package:aplication_news/controller/everything_controller.dart';
import 'package:aplication_news/models/news_models.dart';
// import 'package:aplication_news/controller/headlines_controller.dart';
import 'package:aplication_news/widgets/floating_search_bar.dart';
import 'package:aplication_news/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:get/route_manager.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final EverytingController controller = Get.find<EverytingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              controller.headlinesController.fetchHeadlines(),
          child: controller.obx(
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
                      Text(
                        'An error has occurred.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8.0),
                      OutlinedButton(
                        onPressed: () async => controller.handleSearch(),
                        child: Text('Try Again Plss :3'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingSearchBar(),
    );
  }
}