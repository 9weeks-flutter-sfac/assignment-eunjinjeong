import 'package:assignment/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const OurSecret());
}

class OurSecret extends StatelessWidget {
  const OurSecret({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "Neo"), home: const mainPage());
  }
}
