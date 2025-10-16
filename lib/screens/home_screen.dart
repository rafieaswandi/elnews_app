import 'package:elnews_app/controller/home_controller.dart';
import 'package:elnews_app/models/on_boarding_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final homeController = Get.put(HomeController());

  @override
s}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabBarController;
  final List<TabInfo> tabs = [
    TabInfo(title: 'Headlines', category: 'general'),
    TabInfo(title: 'Business', category: 'business'),
    TabInfo(title: 'Entertainment', category: 'entertainment'),
    TabInfo(title: 'Health', category: 'health'),
    TabInfo(title: 'Science', category: 'science'),
    TabInfo(title: 'Sports', category: 'sports'),
    TabInfo(title: 'Technology', category: 'technology'),
  ];

  @override

  void initState() {
    tabBarController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ElNews'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabBarController,
          tabs: tabs.map((tab) => Tab(text: tab.title)).toList(),
          isScrollable: true,
        ),
      ),
      body: Center(child: Text('Home Screen')),
      );
  }
}