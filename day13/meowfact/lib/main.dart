import 'package:dio/dio.dart';

class MeowFact {
  List<String> data;

  MeowFact({required this.data});

  factory MeowFact.fromMap(Map<String, dynamic> map) {
    var data = List<String>.from(
        map['data']); // map['data']가 dynamic데이터 타입인데 강제로 List<String>으로 바꿔준다.
    return MeowFact(data: data);
  }
  @override
  String toString() {
    return "MeowFact ($data)";
  }
}

void main() async {
  Dio dio = Dio();
  var url = 'https://meowfacts.herokuapp.com/';

  for (var i = 0; i < 10; i++) {
    var response = await dio.get(url);

    if (response.statusCode == 200) {
      var fact1 = MeowFact.fromMap(response.data);
      print(fact1);
    }
  }
}
