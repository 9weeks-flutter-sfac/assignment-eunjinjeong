import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcatt/controller/auth_controller.dart';

class SignUpController extends GetxController {
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var pwController = TextEditingController();
  var pw2Controller = TextEditingController();

  signup() {
    Get.find<AuthController>().signup(
      emailController.text,
      usernameController.text,
      pwController.text,
      pw2Controller.text,
    );
  }
}
