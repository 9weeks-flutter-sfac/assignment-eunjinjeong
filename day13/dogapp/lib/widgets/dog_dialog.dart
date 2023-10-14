import 'package:flutter/material.dart';

import '../model/dog.dart';

class dogDialog extends StatelessWidget {
  const dogDialog({super.key, required this.dog});
  final Dog dog;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(dog.message),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('close')),
          ],
        ),
      ),
    );
  }
}
