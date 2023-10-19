import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secretcatt/controller/auth_controller.dart';

class settingPage extends GetView<AuthController> {
  //setting controller가 없으나 authcontroller에 필요한 것들이 있기 때문에 가져와서 쓰도록!
  const settingPage({super.key});
  static const String route = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(controller.user!.name),
            subtitle: Text(controller.user!.username),
          ),
          ElevatedButton(
              onPressed: controller.logout, child: const Text('로그아웃'))
        ],
      ),
    );
  }
}
