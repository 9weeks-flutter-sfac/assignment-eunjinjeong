import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {
  Quiz({super.key});

  var dio = Dio();

  void getData() async {
    for (var i = 100; i <= 150; i++) {
      try {
        var res = await dio.post(
          "https://sniperfactory.com/sfac/http_assignment_$i",
          options: Options(
            headers: {
              'user-agent': 'SniperFactoryBrowser',
              'authorization': 'ej'
            },
          ),
        );
        print(res);
      } catch (e) {
        print('에러가 발생했습니다');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('8일차 Quiz'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getData();
          },
          child: const Text(
            'Quiz 정답 확인',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    ));
  }
}
