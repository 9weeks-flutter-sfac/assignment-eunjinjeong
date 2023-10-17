import 'license.dart';
import 'meaning.dart';
import 'phonetic.dart';

class Dict {
  String word;
  String? phonetic;
  List<Phonetic> phonetics; //phonetic이라는 클래스에 있으며 list로 나열
  List<Meaning> meanings; //meaning 이라는 클래스에 있으며 list로 나열
  License license; // License라는 클래스에 있음.
  List<String> sourceUrls; // 클래스는 없으나 sourceUrls가 반복되고 있기 때문에 List 배열이 되어있을 것.

  Dict({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
      word: map['word'],
      phonetic: map['phonetic'],
      phonetics: List<Phonetic>.from(map['phonetics'].map((e) => Phonetic.fromMap(
          e))), //List<dynamic>을 Phonetic으로 만들어주겠다. dynamic을 map을 활용해 모든 요소를 phonetic에 넣어준다.
      meanings: List<Meaning>.from(
          map['meanings'].map((e) => Meaning.fromMap(e))), // Meaning도 마찬가지
      license: License.fromMap(
          map['license']), //Map<String, Map>을 License 데이터 타입으로 바꿔주겠다.
      sourceUrls: List<String>.from(
          map['sourceUrls']), //List <dynamic>이지만 String으로 만들어야 해서.
    );
  }
}
