import 'package:aplication_news/core/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppStartedController extends GetxController {
  final _box = GetStorage();
  final RxBool _isFirstTime = true.obs;
  final String _key = 'isFisrtTime';

  bool get isFirstTime => _isFirstTime.value;

  void _loadInitials() {
    final isFirstTime = _box.read(_key) ?? true;

    if (isFirstTime) {
      _isFirstTime.value = true;
      _box.write(_key, true);
    } else {
      _isFirstTime.value = false;
      _box.write(_key, false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadInitials();
  }

  void setFirtsTimeDone() {
    _isFirstTime.value = false;
    _box.write(_key, false);
    Get.offNamed(AppRouter.home);
  }
}