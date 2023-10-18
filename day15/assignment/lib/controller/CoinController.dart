import 'dart:async';
import 'package:get/get.dart';

class CoinController extends GetxController {
  var coin = 0.obs;
  void reset(int value) => coin(value);
  //reset: 새로운 값을 받아 coin 변수의 값을 그 값으로 설정

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      coin++;
    });
  }
  //1초마다 1씩 증가

  @override
  void onInit() {
    super.onInit();

    ever(
        coin,
        (_) => coin % 10 == 0 && coin != RxInt(0)
            ? Get.snackbar('코인$coin개 돌파!', '축하합니다!')
            : null);
  }
  // coin 변수의 값이 10의 배수이면서 0이 아닌 경우 스낵바 출력.
  // 조건에 충족하지 않으면 null
}
