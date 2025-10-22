import 'package:aplication_news/connect/headlines_provider.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:get/get.dart';

class HeadlinesController extends GetxController with StateMixin {
  final String category;
  HeadlinesController({required this.category});

  late final HeadlinesProvider headlinesProvider = Get.put(
    HeadlinesProvider(category: category),
    tag: category,
    );

  void fetchHeadlines() async {
    change(null, status: RxStatus.loading());
    try {
      final News news = await headlinesProvider.getHeadlines();

      if (news.totalResults == 0) {
        change(null, status: RxStatus.empty());
      } else {
        change(news, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  bool operator ==(Object other) {
    return super == other;
  }
}