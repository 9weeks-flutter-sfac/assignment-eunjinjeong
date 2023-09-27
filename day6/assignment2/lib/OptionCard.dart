import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.foodName,
    required this.imgUrl,
  });

  final String foodName;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Image.asset(
            imgUrl,
            fit: BoxFit.cover,
          ),
        ),
        Text(foodName),
        const Text('[담기]'),
      ]),
    );
  }
}
