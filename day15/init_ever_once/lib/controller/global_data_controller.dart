import 'package:get/get.dart';

import '../model/user.dart';

class GlobalDataController extends GetxController {
  Rxn<User> user = Rxn(); // 초기값은 null이어야 하기 때문에

  @override // controller가 생성되자마자 실행할 수 있는 함수
//=> 새로고침하면 controller가 생성되고 초기화된 후 바로 이 함수가 실행된다. 따라서
//원하는 동작을 하는 함수를 여기에 넣어주면 된다.
  void onInit() {
    super.onInit();
    ever(user, (value) {
      //ever를 바라보고, value를 받아본다.
      if (value == null) {
        Get.to(() => LoginPage());
        return;
      }
      Get.to(() => MainPage());
      return;
    });
  }
} // user가 바뀔 때 마다 이 함수가 실행된다.
// ever: 데이터가 바뀔 때마다 실행할 함수
