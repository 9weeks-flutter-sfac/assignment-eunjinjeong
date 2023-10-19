import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:secretcatt/util/api_routes.dart';

import '../model/secret.dart';

class SecretController extends GetxController {
  final RxList<Secret> _secrets = <Secret>[].obs;
  Dio dio = Dio();

  List<Secret> get secrets => _secrets;

  fetchSecrets() async {
    var res = await dio.get(ApiRoutes.secrets);
    var items = List<Map<String, dynamic>>.from(res.data['items']);
    items.map((e) => Secret.fromMap(e)).toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchSecrets();
  }
}
