import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';

class AppStartedController extends  {
  final box = GetStorage();
  final RxBool _isFirstTime = true.obs;
  final String _key = 'isFirstTime';

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
}