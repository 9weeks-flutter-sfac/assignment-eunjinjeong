import 'package:day16/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';
// 페이지를 쉽게 관리하기 위해 static으로 만들어서 route 관리하기.

  @override
  Widget build(BuildContext context) {
    var user = Get.find<AuthController>()
        .user!; // authcontroller로 user 정보 가져오기. !를 꼭 붙여야 출력이 됨. (data가 무조건 있다)
    return Scaffold(
      bottomNavigationBar: Obx(
        // 실시간으로 바뀌는 값이 필요하기 때문. 네비게이션바를 누르면 실행되도록.
        () => BottomNavigationBar(
          currentIndex: controller.curPage.value, // rxint값이기 때문에 value를 가져와야 함.
          onTap: controller.onPageTapped, //네비게이션바를 눌렀을 때 페이지가 이동 될 수 있도록.
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'my'),
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pagecontroller,
          children: [
            Text(
              '${user.username}님 안녕하세요',
              style: const TextStyle(fontSize: 30),
            ),
            Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(),
                  title: Text(user.username),
                  subtitle: Text(user.name),
                ),
                ListTile(
                  title: const Text('로그아웃하기'),
                  leading: const Icon(Icons.logout),
                  onTap: () {
                    controller.logout();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
