class Definition {
  String definition;
  List<String> synonyms; // string 형태로 List에 들어갈 것.
  List<String> antonyms; // string 형태로 List에 들어갈 것.
  String? example; //example이 없는 경우도 있기 때문에 null일 수 있음을 표시

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  factory Definition.fromMap(Map<String, dynamic> map) {
    return Definition(
      // serializaion을 할 factory함수. map을 주면 Definition을 던져주는 fromMap이라는 생성자.
      definition: map['definition'],
      synonyms: List<String>.from(
          map['synonyms']), // List <dynamic>이지만 String으로 만들어야 해서.
      antonyms: List<String>.from(
          map['antonyms']), // List <dynamic>이지만 String으로 만들어야 해서.
      example: map['example'],
    );
  }
}
