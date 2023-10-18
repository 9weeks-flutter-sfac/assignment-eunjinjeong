import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/global_data_controller.dart';
import 'package:getx/page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(GlobalDataController());
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: const MainPage(),
    );
  }
}
