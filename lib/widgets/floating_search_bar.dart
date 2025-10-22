import 'dart:ui';
import 'package:aplication_news/controller/everything_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:aplication_news/core/routes.dart';
// import 'package:get/get.dart';
// import 'package:get/utils.dart';

class FloatingSearchBar extends StatelessWidget {
  FloatingSearchBar({super.key});

  final EverytingController controller = Get.put(EverytingController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        spacing: 8.0,
        children: [
          // serch field
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(48.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(48.0)),
                    ),
                    hintText: 'search',
                  ),
                  textInputAction: TextInputAction.search,
                  onTapOutside: (event) => 
                      FocusManager.instance.primaryFocus?.unfocus(),
                  // onTap: () => Get.toNamed(AppRouter.search),
                ),
              ),
            ),
          ),
          ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: IconButton.outlined(
                padding: const EdgeInsets.all(16.0),
                icon: const Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}