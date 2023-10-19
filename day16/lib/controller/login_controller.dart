import 'package:day16/controller/auth_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

//<login페이지에서만 사용할 controller 만들기>
// id를 입력받을 수 있는 idController를 만들어서 여기에 TextEditingController를 넣어주기.

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

//login이 실행될 때 실행할 함수 만들기 (로그인 시켜주는 함수)
//=> 이미 authcontroller에서 login 함수 만든게 있으니 찾아오도록 하기.

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }
}
