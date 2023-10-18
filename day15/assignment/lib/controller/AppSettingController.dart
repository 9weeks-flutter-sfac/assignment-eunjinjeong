import 'package:get/get.dart';

class AppSettingController extends GetxController {
  bool isSoundOn = true;
  bool isNotificationOn = true;
  String appVersion = '';
  String appName = '';
  String appAuthor = '';
  String appPackageName = '';
  DateTime? lastUpdated;
}
