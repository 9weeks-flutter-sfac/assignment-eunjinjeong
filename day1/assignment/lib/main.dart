import 'package:flutter/material.dart';
//테스트 123123

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                    text: "안녕하세요!\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "간단하게 제 ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "소개",
                    style: TextStyle(
                        color: Color.fromRGBO(31, 149, 242, 1),
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "를 해보겠습니다\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "먼저 저의 MBTI는 ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "INFJ",
                    style: TextStyle(
                        color: Color.fromRGBO(244, 66, 52, 1),
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "이고\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "직업은 ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "개발자",
                    style: TextStyle(
                        color: Color.fromRGBO(76, 175, 79, 1),
                        fontSize: 23,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "입니다.\n\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "꿈",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 202, 138, 1),
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.black)),
                TextSpan(
                    text: "은 없고요\n 그냥 놀고 싶습니다\n\n",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    )),
                TextSpan(
                    text: "감사합니다\n",
                    style: TextStyle(
                        color: Color.fromRGBO(224, 64, 251, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
