import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String dateFormat(DateTime datetime) {
    final DateFormat formatDate = DateFormat('dd MMMM yyyy - hh:mm a');
    return formatDate.format(datetime);
  }

  static Future<void> openUrl(String url) async {
    try {
      final Uri parsedUrl = Uri.parse(url);
      if (!await launchUrl(parsedUrl)) {
        throw Exception('Could not launch $parsedUrl');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not launch url',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        animationDuration: Duration(milliseconds: 300),
      );
    }
  }
}