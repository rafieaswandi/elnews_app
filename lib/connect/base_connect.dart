import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class BaseConnect extends GetConnect {
  @override
  void onInit() {
    final String baseUrl = dotenv.get('BASE_URL');
    final String apiKey = dotenv.get('API_KEY');

    httpClient.baseUrl = baseUrl;
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = const Duration(seconds: 10);

    httpClient.addRequestModifier<void>((request) {
      // request.headers['Authorization'] = 'Bearer $apiKey';
      request.headers['x-api-key'] = apiKey;
      return request;
    });
    
    super.onInit();
  }
}