import 'package:assignment/model/post.dart';
import 'package:flutter/material.dart';

class postBottomSheet extends StatelessWidget {
  const postBottomSheet({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(post.body),
          ],
        ),
      ),
    );
  }
}
