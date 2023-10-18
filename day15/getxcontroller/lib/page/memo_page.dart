import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:getxcontroller/controller/app_global_data_controller.dart';

class MemoPage extends StatelessWidget {
  const MemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: Get.find<AppGlobalDataController>().memo.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(Get.find<AppGlobalDataController>()
                .memo[index]), // index로 하나씩 가져오게끔
          ),
        ),
      ),
    );
  }
}
