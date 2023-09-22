import 'package:assignment2/OptionCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List myMenue = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              myMenue = [];
              setState(() {});
            },
            label: const Text('초기화 하기')),
        appBar: AppBar(
          title: const Text(
            "분식왕 이테디 주문하기",
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "주문 리스트",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(myMenue.toString()),
            const SizedBox(height: 8),
            const Text(
              "음식",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      myMenue.add('떡볶이');
                      setState(() {});
                    },
                    child: const OptionCard(
                      foodName: '떡볶이',
                      imgUrl: 'assets/option_bokki.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenue.add('맥주');
                      setState(() {});
                    },
                    child: const OptionCard(
                      foodName: '맥주',
                      imgUrl: 'assets/option_beer.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenue.add('김밥');
                      setState(() {});
                    },
                    child: const OptionCard(
                      foodName: '김밥',
                      imgUrl: 'assets/option_kimbap.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenue.add('오므라이스');
                      setState(() {});
                    },
                    child: const OptionCard(
                      foodName: '오므라이스',
                      imgUrl: 'assets/option_omurice.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenue.add('오므라이스');
                      setState(() {});
                    },
                    child: const OptionCard(
                      foodName: '돈까스',
                      imgUrl: 'assets/option_pork_cutlets.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenue.add('오므라이스');
                      setState(() {});
                    },
                    child: const OptionCard(
                      foodName: '라면',
                      imgUrl: 'assets/option_ramen.png',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      myMenue.add('오므라이스');
                      setState(() {});
                    },
                    child: const OptionCard(
                      foodName: '우동',
                      imgUrl: 'assets/option_udon.png',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
