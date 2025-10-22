import 'package:aplication_news/controller/home_controller.dart';
import 'package:aplication_news/widgets/category_content.dart';
import 'package:aplication_news/widgets/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Newen'),
        centerTitle: true,
        bottom: TabBar(
          controller: homeController.tabBarController,
          tabs: homeController.tabs.map((tab) => Tab(text: tab.title)).toList(),
          isScrollable: true,
          indicatorWeight: 4.0,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: TabBarView(
        controller: homeController.tabBarController,
        children: homeController.tabs
            .map((tab) => CategoryContent(category: tab.category))
            .toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingSearchBar(),
    );
  }
}