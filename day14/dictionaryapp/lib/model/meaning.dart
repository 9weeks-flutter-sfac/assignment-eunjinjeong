import 'difinition.dart';

class Meaning {
  String partofspeech;
  List<Definition> definitions; // definition도 class를 만들어줘야 함

  Meaning({
    required this.partofspeech,
    required this.definitions,
  });

  factory Meaning.fromMap(Map<String, dynamic> map) {
    return Meaning(
      partofspeech: map['partOfSpeech'],
      definitions: List<Definition>.from(
          map['definitions'].map((e) => Definition.fromMap(e))),
    );
  }
}
