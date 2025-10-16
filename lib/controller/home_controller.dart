import 'package:elnews_app/models/on_boarding_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<TabInfo> tabs = [
    TabInfo(title: 'Business', category: 'business'),
    TabInfo(title: 'Entertainment', category: 'entertainment'),
    TabInfo(title: 'Headlines', category: 'general'),
    TabInfo(title: 'Health', category: 'health'),
    TabInfo(title: 'Science', category: 'science'),
    TabInfo(title: 'Sports', category: 'sports'),
    TabInfo(title: 'Technology', category: 'technology'),
  ];

  late TabController tabBarController;

  @override
  void onInit() {
    tabBarController = TabController(length: tabs.length, vsync: ScrollableState());
    super.onInit();
  }

  @override
  void onClose() {
    tabBarController.dispose();
    super.onClose();
  }
}