import 'package:get/get.dart';

class AppGlobalDataController extends GetxController {
  String name;
  int age;
  List<String>
      memo; // controller에 리스트로 보여줄 memo를 추가하기 위해 여기에 추가! => mainpage에도 추가 필요.

  AppGlobalDataController({
    required this.name,
    required this.age,
    required this.memo,
  });
}
