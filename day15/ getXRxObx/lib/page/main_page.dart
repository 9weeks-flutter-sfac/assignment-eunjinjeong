import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/global_data_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GlobalDataController>();
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(controller.myName.value),
          Obx(() => Text(controller.myLevel.value
                  .toString()) //.value로 꺼내야 myLevel를 꺼낼 수 있음
              ), // 실시간으로 변화하는 텍스트를 보기 위해 반응형 위젯인 obx로 감쌌음. setState가 없어도 스스로 보여줌.

          ElevatedButton(
            onPressed: () {
              controller.myLevel(controller.myLevel.value + 1); //
            },
            child: const Text('+1'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.myName('Angie');
            },
            child: const Text('이름변경하기'),
          ),
        ],
      ),
    ));
  }
}
