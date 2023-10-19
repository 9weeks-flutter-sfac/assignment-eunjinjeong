import 'package:get/route_manager.dart';
import 'package:secretcatt/view/login_page.dart';
import 'package:secretcatt/view/main_page.dart';
import 'package:secretcatt/view/secret_page.dart';
import 'package:secretcatt/view/setting_page.dart';
import 'package:secretcatt/view/signup_page.dart';
import 'package:secretcatt/view/upload_page.dart';

class AppPages {
  static final pages = [
    GetPage(name: mainPage.route, page: () => const mainPage()),
    GetPage(name: LoginPage.route, page: () => const LoginPage()),
    GetPage(name: secretPage.route, page: () => const secretPage()),
    GetPage(name: settingPage.route, page: () => const settingPage()),
    GetPage(name: SignupPage.route, page: () => const SignupPage()),
    GetPage(name: UploadPage.route, page: () => const UploadPage()),
  ];
}
