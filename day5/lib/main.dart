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
        appBar: AppBar(
          title: const Text("1번 문제"),
        ),
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

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  String inputText = '';
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2번 문제"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 200),
          TextField(
            controller: myController,
            onChanged: (text) {
              setState(() {
                inputText = text;
              });
            },
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(inputText,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myController.clear();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  bool isSunClicked = false;
  bool isMoonClicked = false;
  bool isStarClicked = false;
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                leading: Icon(
                  Icons.sunny,
                  color: isSunClicked ? Colors.red : Colors.grey,
                ),
                title: const Text('Sun'),
                trailing: IconButton(
                    onPressed: () {
                      isSunClicked = !isSunClicked;
                      setState(() {});
                    },
                    icon: const Icon(Icons.navigate_next)),
              ),
              ListTile(
                leading: Icon(
                  Icons.nightlight,
                  color: isMoonClicked ? Colors.orange : Colors.grey,
                ),
                title: const Text('Moon'),
                trailing: IconButton(
                    onPressed: () {
                      isMoonClicked = !isMoonClicked;
                      setState(() {});
                    },
                    icon: const Icon(Icons.navigate_next)),
              ),
              ListTile(
                leading: Icon(
                  Icons.star,
                  color: isStarClicked ? Colors.yellow : Colors.grey,
                ),
                title: const Text('Star'),
                trailing: IconButton(
                    onPressed: () {
                      isStarClicked = !isStarClicked;
                      setState(() {});
                    },
                    icon: const Icon(Icons.navigate_next)),
              ),
            ],
          ),
          TextField(
              decoration: const InputDecoration(
                hintText: "키고 끄고 싶은 아이콘을 입력하세요.",
                hintStyle: TextStyle(fontSize: 20),
              ),
              onSubmitted: (value) {
                setState(() {
                  switch (value) {
                    case '태양':
                      isSunClicked = !isSunClicked;
                      break;
                    case '달':
                      isMoonClicked = !isMoonClicked;
                      break;
                    case '별':
                      isStarClicked = !isStarClicked;
                      break;
                    default:
                      iconColor = Colors.grey;
                      break;
                  }
                });
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isSunClicked = false;
          isMoonClicked = false;
          isStarClicked = false;
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
