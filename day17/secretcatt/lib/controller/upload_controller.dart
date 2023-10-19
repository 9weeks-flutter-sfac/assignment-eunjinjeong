import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:secretcatt/util/api_routes.dart';

class UploadController extends GetxController {
  var inputController = TextEditingController();
  Dio dio = Dio();

  upload() async {
    if (inputController.text.isEmpty) return;
    var res = await dio
        .post(ApiRoutes.upload, data: {'secret': inputController.text});
  }
}
