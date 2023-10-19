import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcatt/controller/signup_controller.dart';

class SignupPage extends GetView<SignUpController> {
  const SignupPage({super.key});
  static const String route = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(controller: controller.emailController),
        TextField(controller: controller.usernameController),
        TextField(controller: controller.pwController),
        TextField(controller: controller.pw2Controller),
        ElevatedButton(onPressed: controller.signup, child: const Text('시작하기'))
      ],
    ));
  }
}
