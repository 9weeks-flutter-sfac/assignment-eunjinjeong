import 'package:day16/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// pageview 처리할 controller 만들기 (페이지라우팅x main페이지에서 페이지뷰)
class MainController extends GetxController {
  var pagecontroller = PageController();
  RxInt curPage = 0.obs;

  onPageTapped(int v) {
    // 처음 눌러졌을 때 받을 값
    pagecontroller.jumpToPage(v);
    curPage(v);
  }

  logout() {
    Get.find<AuthController>().logout();
  }
}
