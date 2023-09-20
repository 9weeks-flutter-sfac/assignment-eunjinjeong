import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(children: [
              const SizedBox(
                width: 150,
                height: 200,
              ),
              const Text(
                "오늘의 하루는",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
              const Text(
                "어땠나요?",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 200,
                child: PageView(children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black,
                              Colors.white,
                            ])),
                    child: const Center(
                        child: Text(
                      "우울함",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.orange,
                              Colors.yellow,
                            ])),
                    child: const Center(
                        child: Text(
                      "행복함",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.blue,
                              Colors.green,
                            ])),
                    child: const Center(
                        child: Text(
                      "상쾌함",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
                  ),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(children: [Divider()]),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 125,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(29, 147, 229, 1)),
                child: const Center(
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.account_circle,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "라이언",
                            style: TextStyle(color: Colors.white, fontSize: 27),
                          ),
                          Padding(
                            padding: EdgeInsets.all(7.0),
                            child: Text(
                              "게임개발",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ),
                          Text(
                            "C#, Unity",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16, height: 0.5),
                          )
                        ]),
                    Padding(
                      padding: EdgeInsets.fromLTRB(180, 10, 10, 10),
                      child: Icon(Icons.add, size: 30, color: Colors.white),
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
