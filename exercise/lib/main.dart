import 'package:flutter/material.dart';

import 'main_page.dart';

void main() {
  runApp(const Oursecret());
}

class Oursecret extends StatelessWidget {
  const Oursecret({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Neo'),
      home: const mainPage(),
    );
  }
}
