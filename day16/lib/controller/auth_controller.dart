import 'package:day16/util/api_routes.dart';
import 'package:day16/view/login_page.dart';
import 'package:day16/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/user.dart';

// <컨트롤러가 user를 가지고 있도록 해주기>
//다른 파일에서는 user를 가져올 수 없도록 private으로 만들고, 초기값은 null
class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();

  User? get user => _user.value;
  // _user이기 때문에 다른 페이지에서 사용 불가능. Getter로 추가한 것.
  //(_user.value를 가져다가 user에 넣는 것.). rxn이라 null safety 추가.
  Dio dio = Dio();

// <컨트롤러의 기능 만들어주기 >
// 1) onInit 을 통해 ever 함수가 먼저 실행되도록 해주기
// 유저가 새로 들어왔을 때 _handelAuthChanged 함수가 실행된다.
// _handelAuthChanged 함수는 유저의 데이터가 있는지 없는지에 따라 회원가입 or 로그인 화면으로 보내주는 함수
  _handelAuthChanged(User? data) {
    if (data != null) {
      Get.toNamed(MainPage.route);
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

//2) 로그인, 로그아웃 기능 만들기
  login(String id, String pw) async {
    // 함수를 통해 id, pw를 받고 이 Id, pw를 통해 api를 연결해준다.

    var res = await dio
        .post('http://52.79.115.43:8090${ApiRoutes.authWithPassword}', data: {
      'identity': id,
      'password': pw,
    });
    if (res.statusCode == 200) {
      var user = User.fromMap(res.data['record']);
      //record를 맵을 활용하여 가져오고 user 에 넣기
      _user(user);
      //_user에 넣기 => user가 초기값 null에서 바뀌었기 떄문에 _handelAuthChanged가 실행된다.
    }
  }

  logout() {
    _user.value = null; // user의 value값을 null로 만들어주기.
  }
}
