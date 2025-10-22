import 'package:aplication_news/connect/base_connect.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:get/get.dart';

class HeadlinesProvider extends BaseConnect {
  final String category;
  HeadlinesProvider({required this.category});

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => News.fromJson(map);
    super.onInit();
  }

  Future<News> getHeadlines() async {
    final Response<News> response = await get<News>(
      '/top-headlines?country=us&category=$category',
    );

    if (response.isOk && response.body != null) {
      return response.body!;
    } else {
      throw Exception(response.statusText ?? 'Unknown error');
    }
  }
}