import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/CoinController.dart';

class storePage extends StatelessWidget {
  const storePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CoinController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '상점',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Obx(
              () => Text(
                '현재 보유한 코인 : ${controller.coin}',
              ),
            ),
            TextButton(
              onPressed: () {
                controller.reset(0);
              },
              child: const Text('코인리셋'),
            ),
          ],
        ),
      ),
    );
  }
}
