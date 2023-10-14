import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  int userId;
  int id;
  String title;
  // 멤버 변수 생성

  Album({required this.userId, required this.id, required this.title});
  // 생성자 생성

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(userId: map['userId'], id: map['id'], title: map['title']);
  } //Map으로 들어온 애의 userId를 접근한다. 하나 하나 매핑해서 왼쪽에 넣어주는 것.
  //이렇게 하나의 Album이라는 객체가 만들어진다. fromMap이 serialization을 돕는 생성자 함수이다.

  @override
  toString() => 'Album($userId, $id, $title)';
}
// String 형태로 출력하기 위해 출력을 해야하는 값을 명령해준다.

void main() async {
  var response =
      await http.get(Uri.parse('http://jsonplaceholder.typicode.com/album/1'));
  if (response.statusCode == 200) {
    print(response.body);
    var album = Album.fromMap(jsonDecode(response.body));
    // reponse.body는 string이다. jsonDecode를 넣어 String을 Map 형태로 바꿔준다.

    print(album);
  }
}
