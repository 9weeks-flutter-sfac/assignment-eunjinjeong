import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcatt/controller/auth_controller.dart';
import 'package:secretcatt/controller/login_controller.dart';
import 'package:secretcatt/controller/signup_controller.dart';
import 'package:secretcatt/util/pages.dart';
import 'package:secretcatt/view/login_page.dart';

import 'controller/secret_controller.dart';
import 'controller/upload_controller.dart';

void main() {
  runApp(const OurSecret());
}

class OurSecret extends StatelessWidget {
  const OurSecret({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: AppPages.pages,
        initialBinding: BindingsBuilder(() {
          Get.put(AuthController());
          Get.lazyPut(() => LoginController());
          Get.lazyPut(() => SignUpController());
          Get.put(() => SecretController(), permanent: true);
          Get.put(() => UploadController(), permanent: true);
        }),
        theme: ThemeData(fontFamily: "Neo"),
        home: const LoginPage());
  }
}
