import 'package:flutter/material.dart';

class adminPage extends StatelessWidget {
  const adminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('관리자페이지'),
      ),
      body: ListView(children: const [
        ListTile(
          title: Text('메뉴 추가'),
        ),
        ListTile(
          title: Text('메뉴 수정'),
        ),
        ListTile(
          title: Text('메뉴 삭제'),
        ),
      ]),
    );
  }
}
