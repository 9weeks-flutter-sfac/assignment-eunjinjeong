import 'package:flutter/material.dart';
import 'package:todoapp/model/meaning.dart';

class MeaningsCard extends StatelessWidget {
  const MeaningsCard({super.key, required this.meaning});
  final Meaning meaning;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(meaning.partofspeech),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: meaning.definitions.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(meaning.definitions[index]
                      .definition), //index로 가서 definition을 보여주도록
                )),
      ],
    ));
  }
}
