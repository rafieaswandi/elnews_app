import 'package:aplication_news/models/news_models.dart';
import 'package:aplication_news/screens/bookmark_screen.dart';
import 'package:aplication_news/screens/home_screen.dart';
import 'package:aplication_news/screens/news_screen.dart';
import 'package:aplication_news/screens/on_boarding_screen.dart';
import 'package:aplication_news/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  static const String home = '/';
  static const String onBoarding = '/onBoarding';
  static const String news = '/news';
  static const String search = '/search';
  static const String bookmark = '/bookmark';

  static List<GetPage<dynamic>> routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: onBoarding, page: () => OnBoardingScreen()),
    GetPage(
      name: news,
      page: () {
        final Article article = Get.arguments as Article;
        return NewsScreen(article: article, title: '',);
      },
    ),
    GetPage(name: search, page: () => SearchScreen()),
    GetPage(name: bookmark, page: () => BookmarkScreen()),
  ];

  // unknown routes
  static Route<dynamic> unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
      },
    );
  }
}