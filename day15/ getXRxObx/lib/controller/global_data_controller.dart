import 'package:get/get.dart';

class GlobalDataController extends GetxController {
  RxInt myLevel = 1.obs; // 1을 관측가능한 mylevel에 넣어줌
  RxString myName = 'AngieJ'.obs;
}
