import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcontroller/controller/app_global_data_controller.dart';

import 'memo_page.dart';
import 'user_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Get.put(AppGlobalDataController(name: 'Angie', age: 99, memo: []));
    //AppGlobalDataController(); 과 동일. controller를 전역에 사용할 수 있게 됨.
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${controller.name}님 / ${controller.age}살'),
          TextButton(
            onPressed: () {
              Get.to(() => const MemoPage());
            },
            child: const Text('To MemoPage'),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const UserPage());
            },
            child: const Text('To UserPage'),
          ),
          TextButton(
              onPressed: () {
                controller.memo.add(
                    '새로운 메모가 추가됐어요'); // main_page는 controller라는 변수에 넣어놨기 때문에 find를 쓰지 않아도 된다.
              },
              child: const Text('Add Memo'))
        ],
      ),
    ));
  }
}
