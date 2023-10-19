import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcatt/controller/login_controller.dart';
import 'package:secretcatt/view/signup_page.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller.idController,
          ),
          TextField(
            controller: controller.pwController,
          ),
          ElevatedButton(
            onPressed: () {
              controller.login();
            },
            child: const Text('로그인'),
          ),
          TextButton(
            onPressed: () => Get.toNamed(SignupPage.route),
            child: const Text('회원가입하기'),
          )
        ],
      ),
    );
  }
}
