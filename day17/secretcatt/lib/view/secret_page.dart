import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/secret_controller.dart';

class secretPage extends GetView<SecretController> {
  const secretPage({super.key});
  static const String route = '/secret';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('뒤로가기'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1616865852593-fc24c5834e4e?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG93bCUyMHdpdGglMjBncmVlbnxlbnwwfHwwfHx8MA%3D%3D'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
        ),
        child: Obx(
          () => PageView.builder(
              itemCount: controller.secrets.length,
              itemBuilder: (context, index) =>
                  Center(child: Text(controller.secrets[index].secret))),
        ),
      ),
    );
  }
}
