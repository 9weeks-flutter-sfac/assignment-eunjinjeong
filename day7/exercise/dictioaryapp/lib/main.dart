import 'package:dictioaryapp/dictonaryscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DictonaryApp());
}

class DictonaryApp extends StatelessWidget {
  const DictonaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> words = [
      {"word": "Apple", "meaning": "사과", "example": "I want to eat an apple"},
      {
        "word": "Paper",
        "meaning": "종이",
        "example": "Could you give me a paper?"
      },
      {
        "word": "Resilient",
        "meaning": "탄력있는, 회복력있는",
        "example": "She's a resilient girl"
      },
      {
        "word": "Revoke",
        "meaning": "취소하다",
        "example":
            "The authorities have revoked their original decision to allow development of this rural area."
      },
      {
        "word": "Withdraw",
        "meaning": "철회하다",
        "example":
            "After lunch, we withdrew into her office to finish our discussion in private."
      },
    ];
    var pageController = PageController();

    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: PageView.builder(
          controller: pageController,
          itemCount: words.length,
          itemBuilder: (context, index) => dictonaryScreen(
            word: words[index]['word'].toString(),
            meaning: words[index]['meaning'].toString(),
            example: words[index]['example'].toString(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            FloatingActionButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: const Icon(Icons.navigate_before),
            ),
            FloatingActionButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: const Icon(Icons.navigate_next),
            ),
          ]),
        ),
      ),
    );
  }
}
