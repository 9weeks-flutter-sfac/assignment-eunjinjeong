import 'package:flutter/material.dart';

class dictonaryScreen extends StatelessWidget {
  const dictonaryScreen(
      {super.key,
      required this.word,
      required this.meaning,
      required this.example});

  final String word;
  final String meaning;
  final String example;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            word,
            style: const TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: -1),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            meaning,
            style: const TextStyle(fontSize: 18, letterSpacing: -1),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            example,
            style: const TextStyle(fontSize: 18, letterSpacing: 1),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
