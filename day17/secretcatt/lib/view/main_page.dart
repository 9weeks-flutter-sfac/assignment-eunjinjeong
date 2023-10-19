import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secretcatt/view/secret_page.dart';
import 'package:secretcatt/view/setting_page.dart';

import 'upload_page.dart';

class mainPage extends StatelessWidget {
  const mainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/image/owl.png'),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                '아워 시크릿',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ListTile(
              tileColor: Colors.green.shade100,
              title: const Text('비밀 보기'),
              onTap: () => Get.toNamed(secretPage.route),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.green.shade100,
              title: const Text('비밀 만들기'),
              onTap: () => Get.toNamed(UploadPage.route),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              tileColor: Colors.green.shade100,
              title: const Text('설정'),
              onTap: () => Get.toNamed(settingPage.route),
            ),
          ],
        ),
      ),
    );
  }
}
