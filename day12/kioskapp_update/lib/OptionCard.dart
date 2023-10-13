import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.foodName,
    required this.imgUrl,
    required this.onTap,
  }) : super(key: key);

  final String foodName;
  final String imgUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(4),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(foodName),
          const Text('[담기]'),
        ]),
      ),
    );
  }
}
