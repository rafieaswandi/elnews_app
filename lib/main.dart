import 'package:aplication_news/controller/app_started_controller.dart';
import 'package:aplication_news/core/routes.dart';
import 'package:aplication_news/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
// import 'controller/everything_controller.dart' as search_controller;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // lock orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // init splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: '.env');
  await GetStorage.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final appStartedController = Get.put(AppStartedController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRouter.home,
      // onGenerateRoute: AppRouter.generateRoute,
      // onUnknownRoute: AppRouter.unknownRoute,
      getPages: AppRouter.routes,
      onReady: () {
        if (appStartedController.isFirstTime) {
          Get.offNamed(AppRouter.onBoarding);
        }
        Future.delayed(const Duration(seconds: 1), () {
          FlutterNativeSplash.remove();
        });
      },
    );
  }
}