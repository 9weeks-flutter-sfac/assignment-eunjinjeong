import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:secretcatt/util/api_routes.dart';
import 'package:secretcatt/view/login_page.dart';
import 'package:secretcatt/view/main_page.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  User? get user => _user.value;

  Dio dio = Dio();

  _handelAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(mainPage.route);
      return;
    }
    Get.toNamed(LoginPage.route);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handelAuthChanged);
  }

  login(String id, String pw) async {
    var res = await dio.post(ApiRoutes.login, data: {
      'identity': id,
      'password': pw,
    });
    if (res.statusCode == 200) {
      var data = Map<String, dynamic>.from(res.data['record']); //record에 접근하도록
      _user(User.fromMap(data)); // 등록할 수 있도록 _user에 넣어주기
    }
  }

  signup(String email, String pw, String pw2, String username) async {
    await dio.post(ApiRoutes.signup, data: {
      'email': email,
      'password': pw,
      'passwordConfirm': pw2,
      'username': username,
    });
  }

  logout() {
    _user.value = null;
  }
}
