import 'package:day16/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
// get.find 없이 logincontroller를 사용할 수 있도록 statelesswidget을 getview로 바꿈

  const LoginPage({super.key});
  static const String route = '/login';
// login 페이지를 쉽게 관리하기 위해 static으로 만들어서 route 관리하기.

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
          // login()함수 실행 => login_controller에서 만든 함수가 실행되어 로그인을 시킴
          child: const Text('로그인'),
        )
      ],
    ));
  }
}
