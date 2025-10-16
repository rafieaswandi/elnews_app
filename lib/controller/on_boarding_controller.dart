import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/app_started_controller.dart';
import 'package:news_app/models/on_boarding_info.dart';

class OnBoardingController extends GetxController {
  final List<OnBoardingInfo> onBoardingData = [
    OnBoardingInfo(
      image: "assets/onboarding1.png",
      title: "Curated Just For You",
      description:
          "Get the stories that matter most. We learn your interests and deliver a personalized news feed, so you're always in the know.",
    ),
    OnBoardingInfo(
      image: "assets/onboarding2.png",
      title: "Stay Ahead of the Headlines",
      description:
          "Be the first to know with real-time alerts for breaking news and major events. Never miss an important update.",
    ),
    OnBoardingInfo(
      image: "assets/onboarding3.png",
      title: "Explore Topics You Love",
      description:
          "From technology and sports to politics and entertainment, follow the topics that interest you and discover new sources.",
    ),
  ];
  final RxInt _currentPageIndex = 0.obs;
  int get currentPageIndex => _currentPageIndex.value;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    _currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex == onBoardingData.length - 1) {
      completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void completeOnboarding() {
    final appStartedController = Get.find<AppStartedController>();
    appStartedController.setFirstTimeDone();
  }
}