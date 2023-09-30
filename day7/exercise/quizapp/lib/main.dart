import 'package:flutter/material.dart';
import 'package:quizapp/QuizCard.dart';

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

class _QuizzAppState extends State<QuizzApp> {
  List<Map<String, dynamic>> quizs = [
    {
      "question": "의학적으로 얼굴과 머리를 구분하는 기준은 어디일까요?",
      "answer": 2,
      "options": ["코", "눈썹", "귀", "머리카락"]
    },
    {
      "question": "다음 중 바다가 아닌 곳은?",
      "answer": 3,
      "options": ["카리브해", "오호츠크해", "사해", "지중해"]
    },
    {
      "question": "심청이의 아버지 심봉사의 이름은?",
      "answer": 2,
      "options": ["심전도", "심학규", "심한길", "심은하"]
    },
    {
      "question": "심청전에서 심청이가 빠진 곳은 어디일까요?",
      "answer": 4,
      "options": ["정단수", "육각수", "해모수", "인당수"]
    },
    {
      "question": "택시 번호판의 바탕색은?",
      "answer": 3,
      "options": ["녹색", "흰색", "노란색", "파란색"]
    }
  ];
  var pageController = PageController(viewportFraction: 0.8);
  List<Icon> result = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.pinkAccent, Colors.blue]),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.navigate_before),
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: result,
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                ),
              ],
            ),
            body: PageView.builder(
              controller: pageController,
              itemCount: quizs.length,
              itemBuilder: (conetxt, index) => QuizCard(
                quiz: quizs[index],
                onCorrect: () {
                  result.add(Icon(Icons.circle_outlined));
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                  setState(() {});
                },
                onIncorrect: () {
                  result.add(Icon(Icons.clear));
                  pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                  setState(() {});
                },
              ),
            ),
            floatingActionButton: result.length == quizs.length
                ? FloatingActionButton(
                    onPressed: () {
                      result.clear();
                      pageController.jumpToPage(0);
                      setState(() {});
                    },
                    child: Icon(Icons.refresh),
                  )
                : null),
      ),
    );
  }
}
