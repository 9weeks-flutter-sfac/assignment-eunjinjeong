import 'package:dio/dio.dart';

class CatFact {
  String fact;
  int length;
// 1. 클래스 만들기

  CatFact({required this.fact, required this.length});
  //2. 생성자 만들기

  factory CatFact.fromMap(Map<String, dynamic> map) {
    //map이라는 걸로 Map 타입을 받아볼게
    return CatFact(
        fact: map['fact'], length: map['length']); // CatFact에 내용을 하나씩 매핑하여 채워주기
  }
  // 3. factory 생성자 만들기

  @override
  String toString() {
    return "CatFact ($fact, $length)";
  }
}

void main() async {
  Dio dio = Dio();
  var url = 'https://catfact.ninja/fact';
  var res = await dio.get(url); // 1. ninja API에 get요청을 보냄

  if (res.statusCode == 200) {
    // 2. 응답을 가지고 ninja 클래스의 인스턴스를 생성하여 출력한다.
    var catFact = CatFact.fromMap(res.data);
    print(catFact);
  }
}
