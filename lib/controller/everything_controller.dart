import 'package:aplication_news/connect/search_provider.dart';
import 'package:aplication_news/core/routes.dart';
import 'package:aplication_news/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EverytingController extends GetxController with StateMixin {
  late final SearchProvider searchProvider = Get.put(SearchProvider());
  late TextEditingController textEditingController;

  get headlinesController => null;

  @override
  void onInit() {
    textEditingController = SearchController();
    super.onInit();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onInit();
  }

  void onSubmit() {
    // Check if controller is empty
    if (textEditingController.text.isEmpty) {
      return;
    }

    if (Get.currentRoute != AppRouter.search) {
      Get.toNamed(AppRouter.search);
    }

    // hadle fetching api
    handleSearch();
  }

  Future<void> handleSearch() async {
    change(null, status: RxStatus.loading());

    try {
      final News news = await searchProvider.getEveryting(
        textEditingController.text.trim().replaceAll(' ', '+').toLowerCase(),
      );

      if (news.totalResults == 0) {
        change(null, status: RxStatus.empty());
      } else {
        change(news, status: RxStatus.success());
      }
      // 
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}