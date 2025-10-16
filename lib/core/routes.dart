import 'package:elnews_app/screens/home_screen.dart';
import 'package:elnews_app/screens/news_screen.dart';
import 'package:elnews_app/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String home = '/';
  static const String onBoarding = '/onboarding';
  static const String news = '/news';

  // generate routes
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case onBoarding:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case news:
        final title = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => NewsScreen(title: title));
      default:
        return unknownRoute(settings);
    }
  }

  // unknown routes
  static Route<dynamic>? unknownRoute(RouteSettings settings) {
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