import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController xController = TextEditingController();
  TextEditingController yController = TextEditingController();
  int x = 0;
  int y = 0;
  int result = 0;

  showResultDialog(BuildContext context, var result) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
                child: Text(
              "$result",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("사칙연산", style: TextStyle(fontSize: 24)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 240),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(19, 0, 50, 0),
                  child: Text(
                    "x의 값은?",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 210,
                  child: TextField(
                    controller: xController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 35, 4, 5),
                      hintText: "x값을 입력하세요.",
                      hintStyle: const TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(19, 0, 50, 0),
                  child: Text(
                    "y의 값은?",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 210,
                  child: TextField(
                    controller: yController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(10, 35, 4, 5),
                      hintText: "y값을 입력하세요.",
                      hintStyle: const TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                int x = int.tryParse(xController.text) ?? 0;
                int y = int.tryParse(yController.text) ?? 0;
                result = x + y;
                setState(() {});
                showResultDialog(context, result);
              },
              child: const Text(
                "더하기의 결과값은?!",
                style: TextStyle(fontSize: 17),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int x = int.tryParse(xController.text) ?? 0;
                int y = int.tryParse(yController.text) ?? 0;
                result = x * y;
                setState(() {});
                showResultDialog(context, result);
              },
              child: const Text(
                "곱하기의 결과값은?!",
                style: TextStyle(fontSize: 17),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int x = int.tryParse(xController.text) ?? 0;
                int y = int.tryParse(yController.text) ?? 0;
                result = x - y;
                setState(() {});
                showResultDialog(context, result);
              },
              child: const Text(
                "빼기의 결과값은?!",
                style: TextStyle(fontSize: 17),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                int x = int.tryParse(xController.text) ?? 0;
                int y = int.tryParse(yController.text) ?? 0;
                result = (x / y).round();
                setState(() {});
                showResultDialog(context, result);
              },
              child: const Text(
                "나누기의 결과값은?!",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
