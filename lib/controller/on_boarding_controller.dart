import 'package:aplication_news/controller/app_started_controller.dart';
import 'package:aplication_news/models/on_boarding_info.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final List<OnBoardingInfo> onBoardingData = [
    OnBoardingInfo(
      image: "assets/images/on-boarding/1n.png",
      title: "Curated Just For You",
      description:
          "Get the stories that matter most, we leave your interact and deliver a personalized news feed, so you're always in the know.",
    ),
    OnBoardingInfo(
      image: "assets/images/on-boarding/2n.png",
      title: "Curated Just For You",
      description:
          "Get the stories that matter most, we leave your interact and deliver a personalized news feed, so you're always in the know.",
    ),
    OnBoardingInfo(
      image: "assets/images/on-boarding/3n.png",
      title: "Curated Just For You",
      description:
          "Get the stories that matter most, we leave your interact and deliver a personalized news feed, so you're always in the know.",
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

  void onPageChange(int index) {
    _currentPageIndex.value = index;
  }

  void nextPage() {
    if (_currentPageIndex.value == onBoardingData.length - 1) {
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void completeOnBoarding() {
    final appStartedController = Get.find<AppStartedController>();
    appStartedController.setFirtsTimeDone();
  }
}