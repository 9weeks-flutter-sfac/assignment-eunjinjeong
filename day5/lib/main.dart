import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("5일차 과제"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 150),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Page2())));
                },
                child: const Text("1번 과제"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Page3()));
                },
                child: const Text("2번 과제"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => const Page4())),
                  );
                },
                child: const Text("3번 과제"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({super.key});

  final List<String> animalList = [
    '강아지',
    '고양이',
    '앵무새',
    '토끼',
    '오리',
    '거위',
    '원숭이'
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          controller: _scrollController,
          itemExtent: 300,
          itemCount: animalList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Center(child: Text(animalList[index])));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _scrollController.jumpTo(0);
          },
          child: const Icon(Icons.vertical_align_top),
        ));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("2번과제"),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text("3번과제"),
    );
  }
}
