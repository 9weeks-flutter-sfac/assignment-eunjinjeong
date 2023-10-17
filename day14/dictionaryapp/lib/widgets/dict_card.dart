import 'package:flutter/material.dart';
import 'package:todoapp/widgets/meanings_card.dart';

import '../model/dict.dart';

class DictCard extends StatelessWidget {
  const DictCard({super.key, required this.dict});

  final Dict dict;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(dict.word),
          ListView.builder(
              shrinkWrap:
                  true, // 스크롤이 가능한 특성상 자식 위젯들이 차지 하는 공간을 계산하지 못하면 에러가 난다
              physics: const NeverScrollableScrollPhysics(),
              // card 위젯은 기본적으로 한 카드 안에서 다 보여주려고 하기 때문에 스크롤 기능이 있으면 에러가 날 수 있다.
              itemCount: dict.meanings.length,
              itemBuilder: (context, index) =>
                  MeaningsCard(meaning: dict.meanings[index])),
          // meaning은 List로 여러 항목을 가지고 있기 때문에 Text가 아닌 Listviewbuilder를 써야함.
        ],
      ),
    );
  }
}
