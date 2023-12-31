import 'package:assignment/controller/CoinController.dart';
import 'package:assignment/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CoinController());
    return GetMaterialApp(
      home: MainPage(),
    );
  }
}
