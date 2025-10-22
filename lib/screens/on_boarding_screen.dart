import 'package:aplication_news/controller/on_boarding_controller.dart';
import 'package:aplication_news/models/on_boarding_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChange,
            itemCount: controller.onBoardingData.length,
            itemBuilder: (context, index) {
              final OnBoardingInfo page = controller.onBoardingData[index];
              return Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(page.image, height: 300),
                    const SizedBox(height: 48),
                    Text(
                      page.title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      page.description,
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),

          Positioned(
            bottom: 40,
            left: 40,
            right: 40,
            child: Column(
              children: [
                Row(
                  spacing: 1.0,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.onBoardingData.length,
                    (index) => Obx(
                      () => Container(
                        margin: const EdgeInsets.only(right: 5),
                        height: controller.currentPageIndex == index ? 16 : 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: controller.currentPageIndex == index
                              ? Colors.deepPurple
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Row(
                  children: [
                    TextButton(
                      onPressed: controller.completeOnBoarding,
                      child: const Text('Skip'),
                    ),
                    IconButton.filled(
                      onPressed: controller.nextPage,
                      style: IconButton.styleFrom(
                        padding: const EdgeInsets.all(16),
                      ),
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}