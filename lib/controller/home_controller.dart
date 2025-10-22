import 'package:aplication_news/models/tab_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
  with GetSingleTickerProviderStateMixin {
  final List<TabInfo> tabs = [
    TabInfo(title: 'Headlines', category: 'General'),
    TabInfo(title: 'Business', category: 'business'),
    TabInfo(title: 'Entertainment', category: 'entertainment'),
    TabInfo(title: 'Health', category: 'health'),
    TabInfo(title: 'Science', category: 'science'),
    TabInfo(title: 'Sport', category: 'sport'),
    TabInfo(title: 'Technology', category: 'technology'),
  ];

  late TabController tabBarController;

  @override
  void onInit() {
    tabBarController = TabController(length: tabs.length, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabBarController.dispose();
    super.onClose();
  }
}