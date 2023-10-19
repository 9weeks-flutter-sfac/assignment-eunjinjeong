import 'package:day16/controller/auth_controller.dart';
import 'package:day16/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/main_controller.dart';
import 'view/login_page.dart';
import 'view/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // AuthController가 제일 처음에 생성될 수 있도록 Bind사용 (페이지가 만들어질 때 같이 get.put하는 기능)
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        // login페이지에 갔을 때 컨트롤러가 실행되어야 하므로 lazy로 대기시킴
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController()); // 컨트롤러등록하기
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage()),
      ], // 각 페이지들을 쉽게 접근할 수 있게 getPages등록.
      home: Scaffold(
        body: Center(
            child: TextButton(
          onPressed: () => Get.toNamed(LoginPage.route),
          child: const Text('hello'),
        )),
      ),
    );
  }
}
