import 'package:assignment/controller/CoinController.dart';
import 'package:assignment/page/store_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  bool isStart = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CoinController>();
    isStart == false ? {controller.startTimer()} : null;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Current coin : ${controller.coin}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const storePage());
              },
              child: const Text('상점으로 이동하기'),
            ),
          ],
        ),
      ),
    );
  }
}
