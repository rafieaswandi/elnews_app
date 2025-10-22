import 'package:aplication_news/connect/base_connect.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:get/get.dart';

class SearchProvider extends BaseConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => News.fromJson(map);
    super.onInit();
  }

    Future<News> getEveryting(String query) async {
    final Response<News> response = await get<News>('/everyting?q=$query',);

    if (response.isOk && response.body != null) {
      return response.body!;
    } else {
      throw Exception(response.statusText ?? 'Unknown error');
    }
  }
}