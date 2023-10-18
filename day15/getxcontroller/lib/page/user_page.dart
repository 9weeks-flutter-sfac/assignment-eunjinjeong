import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxcontroller/controller/app_global_data_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppGlobalDataController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.name),
            Text(controller.age.toString()),
          ],
        ),
      ),
    );
  }
}
