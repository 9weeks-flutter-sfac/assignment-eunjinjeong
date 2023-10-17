import 'license.dart';

class Phonetic {
  String text;
  String? audio;
  String? sourceUrl;
  License? license;

  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    required this.license,
  });

  factory Phonetic.fromMap(Map<String, dynamic> map) {
    return Phonetic(
      text: map['text'],
      audio: map['audio'],
      sourceUrl: map['sourceUrl'],
      license: map['license'] != null
          ? License.fromMap(map['license'])
          : null, //license 자체가 없을 수 있는데 fromMap은 무조건 Map이라 생각하고 돌아감. License.fromMap(null)이 되면 에러가 나기 때문에 삼항연산자 사용.
    );
  }
}
