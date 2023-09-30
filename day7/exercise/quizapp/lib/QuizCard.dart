import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(
      {super.key,
      required this.quiz,
      required this.onCorrect,
      required this.onIncorrect});
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 65),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quiz['question'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
            itemCount: quiz['options'].length,
            shrinkWrap: true,
            itemBuilder: (conext, index) => ElevatedButton(
              onPressed: () {
                if (quiz['answer'] == index + 1) {
                  onCorrect();
                } else {
                  onIncorrect();
                }
              },
              child: Text(quiz['options'][index]),
            ),
          ),
        ],
      ),
    );
  }
}
